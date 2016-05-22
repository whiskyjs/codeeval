# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  hex, bin = line.split " | "
  hex, bin = hex.split(" ").map{|s| s.to_i(16)}, bin.split(" ").map{|s| s.to_i(2)}

  puts (bin.reduce(&:+) >= hex.reduce(&:+)).to_s.capitalize
end