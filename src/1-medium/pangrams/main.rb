# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  delta_chars = [* 'a'..'z'] - line.downcase.chars.uniq
  puts delta_chars.empty? ? 'NULL' : delta_chars.join("")
end