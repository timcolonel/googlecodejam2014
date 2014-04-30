require 'bundler'

Bundler.require(:default)

file = File.new('q2data.txt', 'r')


cases = file.gets.to_i
cases.times.each do |cas|
  n = file.gets.to_i
  levels1 =[]
  levels2 = []
  n.each do |level|
    a, b = file.gets.split.map(&:to_i)
    levels1 << a
    levels1 << b
  end

  current = 0
  until levels.empty? do
    min = 0
    min_i  = nil
    levels1.size.times.each do |i|
    end
  end
  puts "Case ##{cas+1}: #{}"
end

file.close