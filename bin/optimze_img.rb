#!/usr/bin/env ruby

# This script crawls the Image directory and makes the graphics more render-worthy.
# This includes creating a low-resolution (20% size) JPEG that can be used as
# The background, and WEBP files for 3 sizes (Mobile, Tablet, Desktop) with 2x for UHD.
#
# I probably don't need to optimize the PNG or JPEG since the goal is to share the Webp
# but I do anyway to reduce the size of the repository.

require 'yaml'
require 'fileutils'

# 1920px (this covers FullHD screens and up)
# 1600px (this will cover 1600px desktops and several tablets in portrait mode, for example iPads at 768px width, which will request a 2x image of 1536px and above)
# 1366px (it is the most widespread desktop resolution)
# 1024px (1024x768 screens, excluding iPads which are hi-density anyway, are rarer, but I think you need some image size in between, not to leave too big a gap between pixel sizes, in case the market changes)
# 768px (useful for 2x 375px mobile screens, as well as any device that actually requests something close to 768px)
# 640px (for smartphones)
def make_responsive(img,type,width)
  [
    ["-resize 'x#{width}>'", ".webp"],
    ["-resize 'x#{width * 2}>'", "@2x.webp"],
  ].each do |i|
    convert(type, img, i.first, i.last)
  end
end
def make_lowres(img)
  dest =
  bits = "-filter Gaussian -resize 20% -interlace JPEG -colorspace sRGB -blur 0x8"
  convert("low", img, bits, ".jpg")
end
def bigger?(b,a)
  b_size = File.size(b)
  a_size = (File.exist?(a)) ? File.size(a) : b_size
  return ((1.0 - (a_size.to_f / b_size.to_f)) * 100.0).positive?
end
def convert(type,origin,bits,dest_ext)
  dir = File.dirname(origin)
  dir.sub!("/images","/images/#{type}") unless type == "optimize"
  FileUtils.mkdir_p(dir) unless File.exist?(dir)

  dest = File.join(dir,File.basename(origin)).sub(File.extname(origin), dest_ext)

  if File.exist?(dest)
    puts "..#{type} -- skipped"
    return dest
  end
  puts "..#{type}"
  `convert #{origin} #{bits} #{dest}`
  return dest
end

# MAIN:
# Enable single-file optimization.
target = ARGV.shift || Dir["assets/images/**/*.{png,jpg}"].sort
target = [target] if target.is_a? String

target.each do |img_file|
  next if ['_converted','.rb','/low'].any? { |word| img_file.include?(word) }

  puts "Processing '#{img_file}'"

  # Optimize the original, and decide which should be retained.
  type  = File.extname(img_file)
  bits  = {
    ".png" => "-strip",
    ".jpg" => "-sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB"
  }[type]

  cfile = convert("optimizing", img_file, bits, "_converted#{type}")

  if File.exist?(cfile)
    if bigger?(img_file, cfile)
      FileUtils.mv(cfile, img_file)
    else
      FileUtils.rm(cfile)
    end
  end

  # Making low resolution for blocking.
  make_lowres(img_file)

  # Converting to Webp with responsive formats.
  next if img_file.include?("/hero") # Leave my hero backgs alone
  make_responsive(img_file,'mobile',768)
  make_responsive(img_file,'tablet',1366)
  make_responsive(img_file,'desktop',1920)
end
