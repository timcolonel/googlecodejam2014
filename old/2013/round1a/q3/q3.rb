require 'bundler'

Bundler.require(:default)

require 'prime'

file = File.new('old/2013/round1a/q3/q3data.txt', 'r')

def get_factors(value, n, m)
  combinations = []
  (1...n).each do |k|
    combinations += (2..m).to_a.repeated_combination(k).to_a
  end
  factors = combinations.select do |c|
    c.inject(:*) == value
  end
  factors
end

file.gets.to_i.times do |i|
  r, n, m, k = file.gets.split(' ').map(&:to_i)
  puts "Case \##{i+1}:"
  r.times do |j|
    results = file.gets.split(' ').map(&:to_i)
    factors = results.map { |x| get_factors(x, k, m) }
    factors.each_with_index do |f, k|
      puts 'F: '+ results[k].to_s + ' -- ' + f.to_s
    end
  end
end
