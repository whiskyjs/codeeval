# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  ary, sum = line.split(";")
  ary, sum = ary.split(",").map(&:to_i), sum.to_i

  matches = []

  ary.each  do |n|
    ary.each do |m|
      next if n == m
      matches << [n, m] if n + m == sum and not matches.include? [m, n]
    end
  end

  if matches.empty?
    puts "NULL"
  else
    puts matches.map{|n| n.to_s.gsub(/[\[\]\s]/, "")}.join(";")
  end
end