require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1c/q1/q1data.txt', 'r')

def consonants(c)
  not ['a', 'e', 'i', 'o', 'u'].include?(c)
end


n = file.gets.to_i
n.times.each do |i|
  name, n= file.gets.split(' ')
  n = n.to_i

  streak = 0
  count = 0
  last_pos = -1
  name.length.times.each do |c_i|
    if consonants(name[c_i])
      streak += 1
    else
      streak = 0
    end

    if streak >= n
      last_pos = c_i - n + 1
    end
    count += last_pos + 1
  end

  puts "Case \##{i+1}: #{count}"
end

file.close