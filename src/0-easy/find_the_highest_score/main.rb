# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  table = []

  line.split("|").each do |row|
    table << row.scan(/-?\d+/).map(&:to_i)
  end

  puts table.transpose.map(&:max).join(" ")
end