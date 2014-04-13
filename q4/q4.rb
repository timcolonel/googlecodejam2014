require 'bundler'

Bundler.require(:default)

file = File.new('q4/q4data.txt', 'r')

def play_war(n_blocks, k_blocks)
  n_blocks = n_blocks.clone
  k_blocks = k_blocks.clone
  win = 0
  lose = 0
  while n_blocks.size > 0
    n_max = n_blocks.max
    sup = k_blocks.select do |x|
      x > n_max
    end
    if sup.size > 0
      k_choose = sup.min
    else
      k_choose = k_blocks.min
    end
    if k_choose > n_max
      lose +=1
    else
      win +=1
    end
    n_blocks.delete(n_max)
    k_blocks.delete(k_choose)
  end
  win
end

def play_dec_war(n_blocks, k_blocks)
  n_blocks = n_blocks.clone
  k_blocks = k_blocks.clone
  win = 0
  lose = 0
  while n_blocks.size > 0
    n_min = n_blocks.min
    n_max = n_blocks.max
    k_min = k_blocks.min
    k_max = k_blocks.max
    n_choose = n_min
    if n_min < k_min
      n_told = k_max - 0.0001
    else
      n_told = k_max + 0.0001
    end

    sup = k_blocks.select do |x|
      x > n_told
    end
    if sup.size > 0
      k_choose = sup.min
    else
      k_choose = k_blocks.min
    end

    if k_choose > n_choose
      lose +=1
    else
      win +=1
    end

    n_blocks.delete(n_choose)
    k_blocks.delete(k_choose)
  end
  win
end


n = file.gets.to_i
(0...n).each do |i|
  nb = file.gets.to_i
  n_blocks = file.gets.split(' ').map(&:to_f)
  k_blocks = file.gets.split(' ').map(&:to_f)


  war = play_war(n_blocks, k_blocks)
  dec_war = play_dec_war(n_blocks, k_blocks)

  puts "Case \##{i+1}: #{dec_war} #{war}"
end