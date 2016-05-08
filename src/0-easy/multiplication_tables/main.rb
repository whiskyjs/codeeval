# encoding: utf-8

(1..12).each do |n|
  (1..12).map {|m| m * n}.each {|x| printf "%4d", x}
  puts
end