# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.split(",").map(&:to_i).uniq.sort.join(",")
end