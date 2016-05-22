# encoding: utf-8

require 'json'

contents = File.read ARGV.first

contents.split($/).each do |line|
  ary, pairs = line.split(" : ")
  ary, pairs = ary.split(" "), (pairs.split(", ").map do |s|
    s =~ /(\d+)-(\d+)/
    [$1.to_i, $2.to_i]
  end)

  pairs.each {|pair| ary[pair[0]], ary[pair[-1]] = ary[pair[-1]], ary[pair[0]]}

  puts ary.join(" ")
end