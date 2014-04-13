require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1b/q2/q2data.txt', 'r')

def get_triangle_size(v)
  return 0 if v < 0
  s = v+1
  (s)*(s+1)/2
end

class Integer
  # binomial coefficient: n C k
  def choose(k)
    # n!/(n-k)!
    pTop = (self-k+1 .. self).inject(1, &:*).to_f
    # k!
    pBottom = (2 .. k).inject(1, &:*).to_f
    pTop / pBottom
  end
end


file.gets.to_i.times do |i|
  n, x, y = file.gets.split(' ').map(&:to_i)

  v = x.abs+y
  outer = get_triangle_size(v.abs)
  inner = get_triangle_size(v.abs-2)
  rem = n-inner

  if n >= outer
    p = 1
  elsif rem <= 0 or (x==0 and rem < outer-inner)
    p = 0
  else
    k = y+1
    p = 0
    if rem >= (outer-inner-1)/2+k
      p = 1.0
    else
      (k..rem).each do |j|
        p+= rem.choose(j)*(0.5**rem)
      end
    end
  end
  puts "Case \##{i+1}: #{p.to_f}"
end
