# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  chars = line.split('')

  occ_count = Hash.new 0
  chars.each {|char| occ_count[char] += 1}

  puts occ_count.find {|*, value| value == 1}.first
end