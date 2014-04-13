require 'bundler'

Bundler.require(:default)

file = File.new('q4/q4data.txt', 'r')


def test(r, c, m)
  f = r*c-m
  sq = Math.sqrt(f)
  return true if sq % 1 == 0 and r >= sq and c >= sq

  full_0_cols = (f/r).to_i-1

  #If we have at least a row of 0
  if full_0_cols > 0
    rem = f-full_0_cols*r
    if rem%r != 1
      true
    elsif (full_0_cols > 1 and r > 2) or (r-2 >= 1+full_0_cols)
      true
    else
      false
    end
  else
    f == 1 or (f>= 4 and f%2 == 0)
  end
end

def build(r, c, m)
  rows = Array.new(r) { Array.new(c, '*') }
  f = r*c-m
  full_0_cols = (f/r).to_i-1
  rem = f
  sq = Math.sqrt(f)
  if sq % 1 == 0 and r >= sq and c >= sq
    (0...sq).each do |c_i|
      (0...sq).each do |r_i|
        rows[r_i][c_i] = '.'
      end
    end
  elsif full_0_cols > 0
    move_last= 0
    if (f-full_0_cols*r)%r == 1
      move_last = 1
      if r-2 >= 1+full_0_cols
        move_last = 1+full_0_cols
      end
    end
    (0...c).each do |c_i|
      (0...r).each do |r_i|
        rows[r_i][c_i] = if rem > 0 or (move_last != 0 and rem + move_last > 0) then
                           '.'
                         else
                           '*'
                         end
        rem -= 1
      end
      if rem <= 0 and move_last != 0
        (0...move_last).each do |d|
          rows[-1][c_i-1-d] = '*'
        end
        move_last = 0 #So bad coding :)
      end
    end
  elsif f > 1
    if c > 1
      d = (f / 2).to_i
      (0...d).each do |r_i|
        rows[r_i][0] = '.'
        rows[r_i][1] = '.'
      end
    else
      (0...f).each do |r_i|
        rows[r_i][0] = '.'
      end
    end
  end
  rows[0][0] = 'c'
  rows
end

def print_rows(rows)
  rows.each do |row|
    puts row.join('')
  end
end

def count(rows)
  count = 0
  rows.each do |row|
    row.each do |col|
      count += 1 if col == '*'
    end
  end
  count
end

n = file.gets.to_i
(0...n).each do |i|
  puts "Case \##{i+1}:"

  r, c, m = file.gets.split(' ').map(&:to_i)

  if test(r, c, m)
    print_rows(build(r, c, m))
  elsif test(c, r, m)
    print_rows(build(c, r, m).transpose)
  else
    puts 'Impossible'
  end
end