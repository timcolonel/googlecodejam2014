require 'bundler'

Bundler.require(:default)

file = File.new('old/2011/round1a/q1/q1data.txt', 'r')

n = file.gets.to_i
(0...n).each do |i|
  n, pd, pg = file.gets.split(' ').map(&:to_f)

  rational = (100/pd).to_r
  min_n = rational.numerator
  min_w = rational.denominator


  puts "Case \##{i+1}: #{min_n}"
end

file.close