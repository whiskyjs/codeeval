# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.to_i.even? ? 1 : 0
end