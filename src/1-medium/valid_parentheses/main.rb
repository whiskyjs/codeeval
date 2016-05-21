# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  stack = []
  braces = {
      ']' => '[',
      ')' => '(',
      '}' => '{',
  }

  # noinspection RubySimplifyBooleanInspection
  puts ((line.chars.each.with_index.reduce(true) do |acc, (c, index)|
    case c
      when * braces.values
        stack << c
      when * braces.keys
        if stack.last == braces[c]
          stack.pop
        else
          break
        end
      else
        break
    end

    if index == line.size - 1
      acc && stack.size == 0
    else
      acc
    end
  end) || false).to_s.capitalize
end