require 'bundler'

Bundler.require(:default)

file = File.new('q2/q2data.txt', 'r')


n = file.gets.to_i
(0...n).each do |i|
  revenue = 2.to_f
  time = 0.to_f
  c, f, x = file.gets.split(' ').map(&:to_f)
  while true
    if x/revenue > (c/revenue+x/(revenue+f))
      time += c/revenue
      revenue += f
    else
      time += x/revenue
      puts "Case \##{i+1}: #{time.round(7)}"
      break
    end
  end

end
