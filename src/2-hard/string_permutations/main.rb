# encoding: utf-8

contents = File.read ARGV.first

class Array
  def delete_at_chain(index)
    self.delete_at(index)
    self
  end
end

contents.split($/).each do |line|
  compose = -> (char_ary, lambda, string = "", &block) do
    if char_ary.size == 0
      block.(string)
    else
      char_ary.each.with_index do |char, index|
        lambda.(char_ary.dup.delete_at_chain(index), lambda, string + char, &block)
      end
    end
  end

  acc = []
  compose.(line.chars, compose) {|string| acc << string}
  puts acc.sort.join(",")
end