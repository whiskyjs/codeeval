# encoding: utf-8

contents = File.read ARGV.first

puts contents.split($/).map(&:to_i).reduce &:+