# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  occ_count = line.split(" ").map(&:to_i).each.with_index.reduce(Hash.new(count: 0, index: 0)) do |acc, (n, index)|
    acc[n] = acc[n].merge(count: acc[n][:count] + 1,
                          index: index)
    acc
  end

  sorted_ary = occ_count.sort {|a, b| a[1][:count] <=> b[1][:count]}
  most_fitting = sorted_ary.select{|n| n[1][:count] == sorted_ary[0][1][:count]}
      .sort {|a, b| a.first <=> b.first}
      .first[1]

  puts most_fitting[:count] == 1 ? most_fitting[:index] + 1 : 0
end