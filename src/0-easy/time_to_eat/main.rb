# encoding: utf-8

require 'time'

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts line.split(" ")
           .map {|date_str| Time.parse(date_str)}
           .sort
           .reverse
           .map {|t| t.strftime "%H:%M:%S"}
           .join(" ")
end