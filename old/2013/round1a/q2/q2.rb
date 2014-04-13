require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1a/q1/q1data.txt', 'r')


file.gets.to_i.times do |i|
  e, r, n = file.gets.split(' ').map(&:to_f)
  v = file.gets.split(' ').map(&:to_f)


end
