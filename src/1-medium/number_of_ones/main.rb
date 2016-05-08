# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).map(&:to_i).each do |num|
  puts num.to_s(2).split("").count {|char| char == '1'}
end