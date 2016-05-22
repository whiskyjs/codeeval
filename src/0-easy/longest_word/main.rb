# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts (line.split(" ").reduce("") do |acc, word|
    acc = word if word.size > acc.size
    acc
  end)
end