# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  n, p1, p2 = line.split(",").map &:to_i

  puts (not ((n & (1 << (p1 - 1))) > 0) ^ ((n & (1 << (p2 - 1)) > 0)))
end