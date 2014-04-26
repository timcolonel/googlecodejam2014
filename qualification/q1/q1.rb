require 'bundler'

Bundler.require(:default)


def read_rows(file)
  rows = []
  (0...4).each do |i|
    rows << file.gets.split(' ')
  end
  rows
end

def get_result(result1, result2, rows1, rows2)
  row1 = rows1[result1-1]
  row2 = rows2[result2-1]
  row1 & row2
end

def find()

  file = File.new('q1data.txt', 'r')

  n = file.gets.to_i


  (0...n).each do |i|
    result1 = file.gets.to_i
    rows1 = read_rows(file)
    result2 = file.gets.to_i
    rows2 = read_rows(file)
    result = get_result(result1, result2, rows1, rows2)
    if result.size == 1
      puts "Case \##{i+1}: #{result[0]}"
    elsif result.size == 0
      puts "Case \##{i+1}: Volunteer cheated!"
    elsif result.size > 1
      puts "Case \##{i+1}: Bad magician!"
    end
  end


  file.close
end


find()