# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  words = line.split ","

  find_seq = -> (rec, seq = [], &block) do
    fitting_indexes = words.each.with_index.reduce([]) do |acc, (word, index)|
      if not seq.include?(index) and word.start_with? words[seq.last][-1]
        acc << index
      else
        acc
      end
    end

    if not fitting_indexes.empty?
      fitting_indexes.each do |index|
        rec.(rec, seq + [index], &block)
      end
    else
      block.(seq) if seq.size > 1
    end
  end

  acc = []

  words.size.times do |index|
    find_seq.(find_seq, [index]) do |seq|
      acc << seq
    end
  end

  if acc.size > 0
    puts acc.sort_by(&:size).last.size
  else
    puts 'None'
  end
end