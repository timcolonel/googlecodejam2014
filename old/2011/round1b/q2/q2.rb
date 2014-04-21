require 'bundler'

Bundler.require(:default)

file = File.new('old/2011/round1b/q2/q2data.txt', 'r')


def possible(t, vendors, d)
  vendors = vendors.clone
  points = vendors.keys.sort
  last_point = points.first-t
  vendors[points.first] -= 1
  points.each do |point|
    last_point += d
    if last_point < point - t
      last_point = point -t
    end
    last_point += (vendors[point]-1)*d
    if last_point - point > t
      return false
    end
  end
  true
end


file.gets.to_i.times do |i|
  vendors = {}
  c, d = file.gets.split(' ').map(&:to_i)
  c.times.each do
    p, v = file.gets.split(' ').map(&:to_i)
    vendors[p] = v
  end

  min = 0
  max = 10**12
  while max-min > (10**-8)*max
    t = (max+min)/2.0

    if possible(t, vendors, d)
      max = t
    else
      min = t
    end
  end
  puts "Case ##{i+1}: #{max}"
end
