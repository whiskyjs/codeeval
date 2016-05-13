# encoding: utf-8

contents = File.read ARGV.first

contents.split($/).each do |line|
  tokens = line.split(" ")

  count = 0

  parse = -> (tokens, rec, target = {operands: [], operation: nil}) do
    loop do
      case token = tokens[count]
        when /[+\-*\/]/
          op_sym = token.to_sym

          if not target[:operation]
            target[:operation] = op_sym
            count += 1
          else
            sub_expr = {operands: [], operation: op_sym}
            count += 1
            target[:operands] << rec.(tokens, rec, sub_expr)
          end
        when /-?\d+(\.\d+)?/
          target[:operands] << token.to_f
          count += 1

          if target[:operands].size == 2
            return target[:operands].reduce &target[:operation]
          end
        else
          raise new RegexpError('Unexpected token: %s' % token)
      end
    end

    return target[:operands].reduce &target[:operation]
  end

  puts parse.(tokens, parse).round
end