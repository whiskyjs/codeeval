# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  num = line.to_i
  stack = []

  loop do
    num = num.to_s.split("").map{|n| n.to_i ** 2}.reduce &:+
    if stack.include? num
      puts 0
      break
    elsif num == 1
      puts 1
      break
    else
      stack << num
    end
  end
end