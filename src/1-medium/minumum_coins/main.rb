# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  sum = line.to_i

  x5 = (sum / 5).floor
  x3 = ((sum - x5 * 5) / 3).floor
  x1 = sum - x5 * 5 - x3 * 3

  puts x5 + x3 + x1
end