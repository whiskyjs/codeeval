# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  puts (line.size.times.reduce(0) do |acc, n|
    acc += 1 if %w(>>--> <--<<).include? line[n .. n + 4]
    acc
  end)
end