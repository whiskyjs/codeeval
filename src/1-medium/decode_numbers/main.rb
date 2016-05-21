# encoding: utf-8

contents = File.read ARGV.first

mappings = (1..26).map {|n| {number: n.to_s, alpha: ('a'.ord + n - 1).chr}}

contents.split($/).each do |line|
  eval = -> (str, rec, processed_str = "", &block) do
    block.(processed_str) if str.empty?

    mappings.each do |hash|
      if str.start_with? num = hash[:number]
        rec.(str[num.length..-1], rec, processed_str + hash[:alpha], &block)
      end
    end
  end

  acc = []
  eval.(line, eval) do |str|
    acc << str
  end

  puts acc.size
end