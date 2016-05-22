# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  str, sub_str = line.split ","
  rx = sub_str.gsub(/([^\\]\*|^\*)/, '.*?')
  puts Regexp.new(rx) === str
end