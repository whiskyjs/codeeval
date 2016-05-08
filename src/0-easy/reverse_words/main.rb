# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.split(/\s+/).reverse.join(" ") unless line.empty?
end