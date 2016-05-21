# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  occ = (digits = line.chars.map(&:to_i)).reduce(Hash.new 0) do |acc, n|
    acc[n] += 1
    acc
  end

  puts (digits.each.with_index.reduce(true) do |acc, (n, index)|
    acc &= n == occ[index]
    break unless acc
    acc
  end) ? 1 : 0
end