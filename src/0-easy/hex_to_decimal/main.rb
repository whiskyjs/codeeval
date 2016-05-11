# encoding: utf-8

contents = File.read ARGV.first

contents.each_line.each {|s| puts s.to_i 16}