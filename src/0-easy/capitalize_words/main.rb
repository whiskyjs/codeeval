# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.split(" ").map{|s| s[0].capitalize << s[1..-1]}.join(" ")
end