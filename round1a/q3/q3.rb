require 'bundler'

Bundler.require(:default)

file = File.new('q3data.txt', 'r')

n = file.gets.to_i
n.times.each do |i|

end

file.close