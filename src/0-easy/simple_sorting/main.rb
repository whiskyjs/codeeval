# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.split(" ").map(&:to_f).sort.map{|n| sprintf "%.3f", n}.join(" ")
end