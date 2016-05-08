# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  size, ary = line.split(";")
  ary_num = ary.split(",").map &:to_i

  occ_count = Hash.new 0
  ary_num.each do |num|
    occ_count[num] += 1

    if occ_count[num] > 1
      puts num
      break
    end
  end
end