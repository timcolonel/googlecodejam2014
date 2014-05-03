require 'bundler'

Bundler.require(:default)

file = File.new('q2data.txt', 'r')


file.gets.to_i.times.each do |i|

end


file.close