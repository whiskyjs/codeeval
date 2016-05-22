# encoding: utf-8

require 'json'

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts JSON.parse(line)["menu"]["items"].reduce(0) {|acc, item| acc + ( item && item['label'] ? item['id'] : 0) }
end