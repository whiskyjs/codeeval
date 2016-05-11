# encoding: utf-8

contents = File.read ARGV.first

coins = {
    'PENNY' => 0.01,
    'NICKEL' => 0.05,
    'DIME' => 0.10,
    'QUARTER' => 0.25,
    'HALF DOLLAR' => 0.50,
    'ONE' => 1.00,
    'TWO' => 2.00,
    'FIVE' => 5.00,
    'TEN' => 10.00,
    'TWENTY' => 20.00,
    'FIFTY' => 50.00,
    'ONE HUNDRED' => 100.00
}.invert.sort.reverse.to_h

contents.split($/).each do |line|
  price, cash = line.split(";").map {|n| n.to_f.round(2)}

  strings = []
  cash_back = (cash - price).round(2)

  if cash_back < 0
    puts "ERROR"
  elsif cash_back == 0
    puts "ZERO"
  else
    begin
      largest_one = coins.keys.find {|c| c <= cash_back}
      cash_back = (cash_back - largest_one).round(2)
      strings << coins[largest_one]
    end until cash_back == 0

    puts strings.join(",")
  end
end