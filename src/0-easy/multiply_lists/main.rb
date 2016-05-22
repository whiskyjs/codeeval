# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  a, b = line.split(" | ").map {|s| s.split(" ").map &:to_i}

  puts (a.map.with_index {|*, index| (a[index] * b[index]).to_s}).join(" ")
end