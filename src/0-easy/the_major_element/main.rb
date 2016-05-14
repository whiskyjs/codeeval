# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  ary = line.split(",").map &:to_i

  occ_count = ary.reduce(Hash.new 0) do |acc, n|
    acc[n] += 1
    acc
  end

  fitting_number = nil
  occ_count.each_pair do |key, value|
    if value > ary.size / 2
      fitting_number = key
      break
    end
  end

  puts fitting_number ? fitting_number : 'None'
end