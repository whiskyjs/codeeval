# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  * str, end_index = line.split(' ')
  end_index = end_index.to_i
  puts str[-end_index]
end