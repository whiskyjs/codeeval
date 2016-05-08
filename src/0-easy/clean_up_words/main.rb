# encoding: utf-8

contents = File.read ARGV.first

contents.force_encoding("utf-8").split($/).each do |line|
  # Can't convert non-ASCII characters to lower case w/o gems
  puts line.scan(/[[:alpha:]]+/).map(&:downcase).join(" ")
end