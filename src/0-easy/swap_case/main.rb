# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts (line.chars.map do |char|
    /[A-Z]/ === char ? char.downcase : char.upcase
  end).join("")
end