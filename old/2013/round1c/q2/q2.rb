require 'bundler'

Bundler.require(:default)

file = File.new('old/2013/round1c/q2/q2data.txt', 'r')

def distance(x1, y1, x2, y2)
  (x1-x2)+(y1-y2)
end

file.gets.to_i.times do |i|
  x, y = file.gets.split(' ').map(&:to_i)

  moves = []
  n =1
  c_x=0
  c_y =0
  while c_x != x and c_y != y
    choices =[]
    choices << distance(c_x, c_y-n, x, y) #South
    choices << distance(c_x, c_y+n, x, y) #North
    choices << distance(c_x-n, c_y, x, y) #West
    choices << distance(c_x+n, c_y, x, y) #East

    case choices.at(choices.min)
      when 0
        moves << 'S'
        c_y -= n
      when 1
        moves << 'N'
        c_y += n
      when 2
        moves << 'W'
        c_x -= n
      when 3
        moves << 'E'
        c_c += n
      else
    end
    n+= 1
  end

  puts "Case \##{i+1}: #{moves.join('')}"
end
