require 'bundler'

Bundler.require(:default)

file = File.new('old/2011/round1b/q1/q1data.txt', 'r')
WIN = 1
LOSE = 0
NOT_PLAYED = -1

n = file.gets.to_i
n.times.each do |i|
  teams = file.gets.to_i

  puts "Case ##{i+1}:"
  wins = []
  played = []
  wps = []
  owps = []
  oowps = []
  scores = []
  teams.times.each do |team|
    scores[team] = file.gets.chomp.split(//).map do |x|
      if x == '1' then
        WIN
      elsif x == '0' then
        LOSE
      else
        NOT_PLAYED
      end
    end
    wins[team] = scores[team].select { |x| x == WIN }.size
    played[team] = scores[team].select { |x| x != NOT_PLAYED }.size
    wps[team] = wins[team]/played[team].to_f
  end

  teams.times.each do |team|
    owp = 0
    p = 0
    teams.times.each do |team_inv|
      if team_inv != team and scores[team][team_inv] != NOT_PLAYED
        p += 1
        if scores[team][team_inv] == LOSE
          owp += (wins[team_inv]-1)/(played[team_inv]-1).to_f
        else
          owp += wins[team_inv]/(played[team_inv]-1).to_f
        end
      end
    end
    owps[team] = owp/p.to_f
  end

  teams.times.each do |team|
    oowp = 0
    p = 0
    teams.times.each do |team_inv|
      if scores[team][team_inv] != NOT_PLAYED
        p +=1
        oowp += owps[team_inv]
      end
    end
    oowps[team] = oowp/p.to_f
  end

  teams.times.each do |team|
    rpi = 0.25*wps[team]+0.5*owps[team]+0.25*oowps[team]
    puts rpi
  end
end

file.close