#!/usr/bin/env ruby

def command(command_string)
  puts "Running: #{command_string}"
  `#{command_string}`
end

def generate_image(base_image_path, size, new_filename)
  command("convert -background none -density 1200 -resize #{size}x#{size} #{base_image_path} #{new_filename}.png")
end

base_image_path = ARGV[0]
if base_image_path.nil? || base_image_path.empty?
  raise(ArgumentError, "Must provide a path as the first argument")
elsif !File.exists?(base_image_path)
  raise(ArgumentError, "No file exists at #{base_image_path}")
end

# Create a "generated" folder
dir_name = "generated"
unless Dir.exists?(dir_name)
  Dir.mkdir(dir_name)
end

[
  [29, "ipad-settings"],
  [40, "ipad-spotlight"],
  [76, "ipad-app"]
].each do |normal_size, icon_name|

  [
    [1, icon_name],
    [2, "#{icon_name}@2x"],
  ].each do |factor, full_icon_name|
    filepath = File.join(dir_name, full_icon_name)
    generate_image(base_image_path, normal_size * factor, filepath)
  end

end

[
  [167, "ipad-pro-app@2x"]
].each do |double_size, icon_name|
  filepath = File.join(dir_name, icon_name)
  generate_image(base_image_path, double_size, filepath)
end
