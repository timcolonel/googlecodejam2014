require 'bundler'

Bundler.require(:default)

require 'prime'

file = File.new('old/2011/round1b/q3/q3data.txt', 'r')

file.gets.to_i.times do |i|
  n, m = file.gets.split(' ').map(&:to_i)
  u = file.gets.split(' ').map(&:to_i)
  v = file.gets.split(' ').map(&:to_i)


  rooms = [(1..n).to_a]

  m.times.each do |edge|
    room = rooms.select { |x| x.include?(u[edge]) and x.include?(v[edge]) }.first
    rooms.delete(room)
    new_room = (u[edge]..v[edge]).to_a
    rooms << new_room
    rooms << (room.first..u[edge]).to_a+(v[edge]..room.last).to_a
  end


  rooms.sort! do |x, y|
    x.size <=> y.size
  end

  pillards = {}

  colors = (1..rooms.first.size).to_a
  rooms.each do |room|
    color_missing = colors.clone
    room.select { |x| not pillards[x].nil? }.each do |pillard|
      color_missing.delete(pillards[pillard])
    end
    room.select { |x| pillards[x].nil? }.each do |pillard|
      if color_missing.size == 0
        pillards[pillard] = colors.first
      else
        pillards[pillard] = color_missing.pop
      end

    end
  end


  puts "Case ##{i+1}: #{rooms.first.size}"
  results = []
  (1..n).each do |pillard|
    results << pillards[pillard]
  end
  puts results.join(' ')
end
