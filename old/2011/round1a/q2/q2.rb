require 'bundler'

Bundler.require(:default)

file = File.new('old/2011/round1a/q2/q2data.txt', 'r')

def play(dict, ps)

  best = nil
  best_score = 0
  ps.each do |choose|
    best = choose if best.nil?
    rem = ps.select { |x| x.length == choose.length } #Get rid of different size
    score = 0
    dict.each_char do |c|
      if rem.any? { |x| x.include?(c) }
        if choose.include?(c)
          choose.length.times do |i|
            if choose[i] == c
              rem.select! { |x| x[i]==choose[i] }
            end
          end
        else
          score +=1
          rem.select! { |x| not x.include?(c) }
        end
      end
      if rem.size <= 1
        if score > best_score
          best = choose
          best_score = score
        end
        break
      end
    end
  end

  best
end

file.gets.to_i.times do |i|
  n, m = file.gets.split(' ').map(&:to_i)

  ds = []
  n.times do |j|
    ds << file.gets.chomp
  end

  results = []
  m.times do
    dict = file.gets
    results << play(dict, ds.clone)

  end
  puts "Case \##{i+1}: #{results.join(' ')}"
end
