require 'bundler'

Bundler.require(:default)

file = File.new('q1data.txt', 'r')


n = file.gets.to_i
n.times.each do |cas|
  a, b = file.gets.split.map(&:to_i)
  ps = file.gets.split.map(&:to_f)
  expected = []
  p = 1
  (0..a).each do |i|
    p*= ps[i-1] if i > 0

    nb_right = b-a +2*(a-i)+1
    nb_wrong = nb_right+b+1
    next if nb_right > b

    p0 = p
    p0 = 0 if i ==0

    #puts "bnb: #{nb_right} #{nb_wrong} --p #{p}"
    e = (p0)*nb_right.to_f+(1-p0)*nb_wrong.to_f
    expected << e
  end
  #Press enter now
  expected << 2+b
  puts "Case ##{cas+1}: #{expected.min}"
end


file.close