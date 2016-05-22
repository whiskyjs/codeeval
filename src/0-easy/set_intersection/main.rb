# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  first, second = line.split(";").map {|s| s.split(",").map(&:to_i)}

  puts (first & second).join(",")
end