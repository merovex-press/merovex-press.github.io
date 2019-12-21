require "awesome_print"
require 'shellwords'
src_dir = "/Users/merovex/Google Drive/Wealth & Career/Merovex Press/Assets/images/articles/"
images = []
Dir["_posts/*.*"].each do |mdf|
  images << open(mdf).grep(/image:/).map{|i| i.gsub(/.*?image:\s+/,"").gsub(/"/,"").chomp}
end
images.flatten!
images.uniq!
# ap images

missing = []
conversion = ""
images.each do |img|
  src_file = src_dir + img
  if File.exist?(src_file)
    webp = "assets/images/articles/#{File.basename(img, File.extname(img))}.webp"
    # puts webp
    puts `cwebp #{src_file.shellescape} -o #{webp}`
    conversion << "#{img} = #{File.size(src_file)} => #{File.size(webp)}\n"
  else
    missing << src_file
  end
end

ap missing
# puts conversion
