# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  chars, indexes = line.split("| ")
  chars, indexes = chars.chars, indexes.split(" ").map(&:to_i)

  puts indexes.reduce("") {|acc, n| acc << chars[n - 1]}
end