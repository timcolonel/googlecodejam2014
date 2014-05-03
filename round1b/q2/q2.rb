require 'bundler'

Bundler.require(:default)

file = File.new('q2data.txt', 'r')


file.gets.to_i.times.each do |i|
  a, b, k = file.gets.split.map(&:to_i)
  ba = a.to_s(2)
  bb = b.to_s(2)
  bk = k.to_s(2)

  c = 0
  (k...a).each do |a0|
    (k...b).each do |b0|
      if a0 & b0 < k
        c += 1
      elsif a0 & b0 > 2*k
        break
      end
    end

    if a0 & (2*k) >= k
      break
    end
  end
  c+= k*k + k*(b-k+a-k)
  if c < 0
    c = 0
  end
  puts "Case ##{i+1}: #{c}"
end


file.close