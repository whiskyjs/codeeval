# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  line =~ /(\d+) (\d+) (\d+)/
  first, second, count = [$1, $2, $3].map &:to_i
  count.times do |n|
    n += 1

    first_factor = n % first == 0
    second_factor = n % second == 0

    if not (first_factor or second_factor)
      print n
    else
      print 'F' if first_factor
      print 'B' if second_factor
    end

    print " " unless n == count
  end

  printf $/
end