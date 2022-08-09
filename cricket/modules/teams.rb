module Teams

  def select_team
  end

  def select_players
  end

  def choose_captain
  end

  def select_opponent_team
  end

  def display_team(team_lable, team)
    puts "\n"
    puts team_lable + " :"
    puts "Team name :" + team['name']
    puts "Captain :" + team['captain']
    team['players'].each do |name, role|
      puts "#{name} => #{role}"
    end
  end
  
end