# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  occ_count = Hash.new 0
  line.downcase!.gsub(/[^a-z]/, "").split("").each do |char|
    occ_count[char] += 1
  end

  occ_count = occ_count.sort_by{|*, count| count}.reverse
  beauty_per_letter = occ_count.each.with_index.reduce({}) do |acc, (occ_ary, index)|
    acc[occ_ary.first] = 26 - index
    acc
  end

  beauty = line.scan(/[a-zA-Z]+/).map {|s| s.split("").reduce(0) {|acc, char| acc + beauty_per_letter[char]}}
  puts beauty.reduce &:+
end