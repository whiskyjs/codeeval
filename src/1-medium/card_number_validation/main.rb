# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  line = line.gsub " ", ""

  puts ((line.chars.map(&:to_i).reverse.each.with_index.reduce(0) do |acc, (n, index)|
    # noinspection RubyNestedTernaryOperatorsInspection
    acc += index % 2 == 1 ? ((double = n * 2) > 9 ? double / 10 + double % 10 : double) : n
  end) % 10 == 0 ? 1 : 0)
end