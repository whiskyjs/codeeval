# encoding: utf-8

contents = File.read ARGV.first

[TrueClass, FalseClass].each do |klass|
  klass.class_eval do
    def to_b
      self ? 1 : 0
    end
  end
end

contents.split($/).each do |line|
  size, matrix_str = line.split(";")
  y, x = size.split(',').map &:to_i
  matrix = []

  y.times do |n|
    matrix << matrix_str.chars[n * x ...(n + 1) * x].map {|c| {mines_around: 0, has_mine?: c == '*'}}
  end

  normalize = -> (i, j) do
    if i < 0 or j < 0 or i >= y or j >= x
      nil
    else
      matrix[i][j]
    end
  end

  y.times do |i|
    x.times do |j|
      matrix[i][j][:mines_around] = ((-1..1).reduce(0) do |acc_n, n|
        acc_n + (-1..1).reduce(0) do |acc_m, m|
          cell = normalize.(i + n, j + m)

          if cell and not [n, m] == [0, 0]
            acc_m + cell[:has_mine?].to_b
          else
            acc_m
          end
        end
      end)
    end
  end

  puts (matrix.reduce("") do |acc, row|
    acc << row.map {|cell| cell[:has_mine?] ? '*' : cell[:mines_around].to_s}.join("")
  end)
end