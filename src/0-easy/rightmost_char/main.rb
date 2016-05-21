# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  next if line.empty?
  str, char = line.split ','
  puts str.rindex(char) || -1
end