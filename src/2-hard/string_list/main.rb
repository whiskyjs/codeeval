# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  count, char_str = line.split(",")
  chars = char_str.chars.uniq.sort

  walk = -> (str, char_pos, acc, lambda) do
    chars.each do |char|
      str[char_pos] = char

      if char_pos == str.size - 1
        acc << str.dup
      else
        lambda.(str, char_pos + 1, acc, lambda)
      end
    end
  end

  acc = []
  walk.(" " * count.to_i, 0, acc, walk)

  puts acc.join(",")
end