# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  str, chars = line.split(',').map &:strip
  puts str.chars.select {|char| not chars.include?(char)}.join
end