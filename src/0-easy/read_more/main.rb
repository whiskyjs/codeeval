# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  if line.size > 55
    trimmed_str = line[0..39]
    last_space_at = trimmed_str.rindex(" ")
    trimmed_str = trimmed_str[0...last_space_at] if last_space_at

    puts trimmed_str << "... <Read More>"
  else
    puts line
  end
end