require 'bundler'

Bundler.require(:default)

file = File.new('q3data.txt', 'r')


file.gets.to_i.times.each do |i|

end


file.close