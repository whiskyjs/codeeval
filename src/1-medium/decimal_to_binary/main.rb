# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.to_i.to_s 2
end