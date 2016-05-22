# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  nums, count = line.split ";"
  nums, count = nums.split(",").map(&:to_i), count.to_i

  puts (nums.each_slice(count).reduce([]) do |acc, batch|
    if batch.size < count
      acc << batch
    else
      acc << batch.reverse
    end

    acc
  end).join(",")
end