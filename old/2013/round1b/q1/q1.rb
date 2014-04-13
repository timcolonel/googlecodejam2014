require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1b/q1/q1data.txt', 'r')

n = file.gets.to_i
(0...n).each do |i|
  r, n= file.gets.split(' ').map(&:to_i)
  motes = file.gets.split(' ').map(&:to_i).sort!
  current = r
  operation = 0
  result = []
  skip = false
  motes.each_with_index do |mote, i|
    if current > mote
      current += mote
    else
      if 2*current-1 <= mote
        result << (operation+motes.size - i)
      end
      if current -1 > 0
        while current <= mote
          operation += 1
          current +=current-1
        end
        current += mote
      else
        skip = true
        break
      end
    end
  end
  result << operation unless skip

  puts "Case \##{i+1}: #{result.min}"
end

file.close