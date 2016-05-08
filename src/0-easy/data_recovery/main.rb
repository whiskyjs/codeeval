# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  words, indexes = line.split(";").map {|part| part.split(/\s+/)}
  indexes.map!(&:to_i) << ([* 1..words.size] - indexes).first
  puts words.zip(indexes).sort_by{|ary| ary.last}.map {|ary| ary.first}.join(" ")
end