# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts (line.split(" ").map {|word| word[-1] + word[1..-2] + word[0]}).join(" ")
end