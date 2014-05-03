require 'bundler'

Bundler.require(:default)

file = File.new('q1data.txt', 'r')


def compute_cost(str, str_t)
  return 0 if str == str_t

  cost = 0
  i = 0
  until str[i].nil? and str_t[i].nil? or str == str_t
    if str[i]!=str_t[i]
      # puts "d #{str[i]} - #{str_t[i]}"
      if str_t[i-1] == str_t[i] and str_t[i+1] == str[i]
        cost += 1
        str_t = str_t[0...i].to_s + str_t[i+1..-1].to_s
        # puts "Removed #{str} -- #{str_t}"
      elsif (str[i-1] == str_t[i-1] and str[i-1] == str[i] and not i-1 < 0) or (str[i+1] == str_t[i+1] and str[i+1] == str[i] and not i >= str_t.size)
        cost += 1
        str_t = str_t[0...i].to_s + str[i].to_s + str_t[i..-1].to_s
        # puts "Added #{str} -- #{str_t}"
      else
        # puts 'ab'
        return nil
      end
    end
    i += 1
  end
  cost
end

file.gets.to_i.times.each do |cas|
  n = file.gets.to_i

  strs = []
  size = 0
  n.times.each do
    strs << file.gets.chomp
    size = strs.size if strs.size > size
  end
  best = nil
  i = 0

  best = 0

  stop = false
  while i < size
    same = true
    strs.each do |s|
      if strs.first[i] != s[i]
        same = false
      end
    end
    unless same
      broke = false
      puts "Not same #{strs}"
      strs.each_with_index do |str, j|
        if str[i] == str[i+1] or str[i] == str[i-1]
          strs[j] = str[0...i].to_s + str[i+1..-1].to_s
          puts strs[j]
          best += 1
          i -= 1
          broke = true
          break
        end

        unless broke
          stop = true
          break
        end
      end
    end

    break if stop
    i += 1
  end

  puts "Case ##{cas+1}: #{best}" unless stop
end


file.close