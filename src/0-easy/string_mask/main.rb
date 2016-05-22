# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  word, mask = line.split " "

  mask.chars.each.with_index do |char, index|
    if char == '1'
      word[index] = (/[A-Z]/ === word[index]) ? word[index].downcase : word[index].upcase
    end
  end

  puts word
end