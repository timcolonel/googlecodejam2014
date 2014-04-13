require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1a/q1/q1data.txt', 'r')

n = file.gets.to_i
(0...n).each do |i|
  r, t = file.gets.split(' ').map(&:to_f)
  count = 1.0/4.0*(Math.sqrt(4.0*r**2.0-4.0*r+8.0*t+1.0)-2*r-3.0) #Wolfram alpha ftw
  puts "Case \##{i+1}: #{count.floor+1}"
end

file.close