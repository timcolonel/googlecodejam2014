require 'bundler'

Bundler.require(:default)

file = File.new('q3data.txt', 'r')

file.gets.to_i.times.each do |cas|

  n= file.gets.to_i
  a = file.gets.split.map(&:to_i)
  v = 0
  n.times.each do |i|
    v += 1 if a[i] >= i
  end

  good = (v <= 515*n/1000)
  puts "Case ##{cas+1}: #{good ? 'GOOD' : 'BAD'}"
end

file.close