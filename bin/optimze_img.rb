#!/usr/bin/env ruby
require 'yaml'
require "humanize-number"
require 'fileutils'

# now =
@today = Time.now.strftime("%Y-%d-%m")
report_file = "image-opt-#{@today}.md"

data_file = "_data/imgopt.yml"
@data = YAML.load(File.open(data_file).read) || {}

@template = "| %s | %s | %s (%3.1f%%) | %s (%3.1f%%) |"
@rows = [
  "| Name | Before | After | WebP |",
  "| ---  | ------:| -----:| ----:|"
]
def make_low(img)
  dir = File.dirname(img).sub("/images","/images/low")
  low = File.join(dir,File.basename(img)).sub('png','jpg')
  puts "MK: #{dir} / #{low}"
  FileUtils.mkdir_p(dir) unless File.exist?(dir)
  bits = "-filter Gaussian -resize 20% -interlace JPEG -colorspace sRGB -blur 0x8"
  `convert #{img} #{bits} #{low}`
end
def bigger?(b,a)
  b_size = File.size(b)
  a_size = (File.exist?(a)) ? File.size(a) : b_size
  return ((1.0 - (a_size.to_f / b_size.to_f)) * 100.0).positive?
end
def addRow(b,a)
  fname = b.sub("assets/images/","")
  b_size = File.size(b)
  a_size = (File.exist?(a)) ? File.size(a) : b_size
  w_size = File.size(b.gsub(File.extname(b), ".webp"))
  d_perc = (1.0 - (a_size.to_f / b_size.to_f)) * 100.0
  w_perc = (1.0 - (w_size.to_f / b_size.to_f)) * 100.0
  # puts [b,fname].inspect
  # begin
  @data[fname] = {
    "changed_on" => @today,
    "original" => b_size,
    "optimize" => a_size,
    "webp"     => w_size
  } if bigger?(b,a)

  @rows << @template % [
    fname,
    HumanizeNumber.humanize(b_size),
    HumanizeNumber.humanize(a_size),
    d_perc,
    HumanizeNumber.humanize(w_size),
    w_perc
  ]
end

target = ARGV.shift || Dir["assets/images/**/*.{png,jpg}"].sort
target = [target] if target.is_a? String

target.each do |img_file|
  next if img_file.include?("_converted")
  next if img_file.include?(".rb")
  next if img_file.include?("/low")

  type = File.extname(img_file)
  cfile = img_file.gsub(type, "_converted#{type}")
  wfile = img_file.gsub(type, ".webp")
  puts "#{img_file}"
  bits = case type
    when ".png"
      "-strip"
    when ".jpg"
      "-sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB"
  end
  # Convert to Converted
  if (false)
    puts "..optimizing"
    `convert #{img_file} #{bits} #{cfile}` unless File.exist?(cfile)

    puts "..webp"
    if bigger?(img_file, cfile)
      `convert #{cfile} #{wfile}`
      FileUtils.mv(cfile, img_file)
    else
      FileUtils.rm(cfile)
      `convert #{img_file} #{wfile}`
    end
    if bigger?(wfile, img_file) || img_file.include?('hero')
      break if img_file.include?('article')
      puts "..WEBP too big"
      FileUtils.rm(wfile)
    end
  end
  puts "..low"
  make_low(img_file)
  # addRow(img_file,cfile)
end

output = <<OUT
---
title: Image Optimization
permalink: /imgopt/
layout: default
---

#{@rows.join("\n")}
OUT

# fn = File.open(report_file,'w')
# fn.write(output)
# fn.close

fn = File.open(data_file,'w')
fn.write(YAML.dump(@data))
fn.close
