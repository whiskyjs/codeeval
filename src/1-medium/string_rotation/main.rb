# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  first, second = line.split ','
  target = first.dup

  was_rotated = false

  begin
    target = target[-1] + target[0..-2]
    if target == second
      was_rotated = true
      break
    end
  end until target == first

  puts was_rotated.to_s.capitalize
end