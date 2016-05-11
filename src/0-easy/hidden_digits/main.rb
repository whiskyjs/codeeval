# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  digits = []

  line.scan /[0-9a-j]/ do |match|
    digits << (('a'..'j').include?(match) ? match.ord - 'a'.ord : match[0].to_i) unless digits.include? match
  end

  puts (str = digits.join("")).empty? ? "NONE" : str
end