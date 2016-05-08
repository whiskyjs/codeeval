# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  str, substr = line.split(',')
  puts str.end_with?(substr) ? 1 : 0
end