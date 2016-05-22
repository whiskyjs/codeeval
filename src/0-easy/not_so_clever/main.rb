# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  ary, count = line.split " | "
  ary, count = ary.split(" ").map(&:to_i), count.to_i

  sort_stupidly = -> (ary) do
    ary.size.times do |n|
      if ary[n] > ary[n + 1]
        ary[n], ary[n + 1] = ary[n + 1], ary[n]
        break
      end
    end
  end

  count.times {|*| sort_stupidly.(ary)}

  puts ary.join " "
end