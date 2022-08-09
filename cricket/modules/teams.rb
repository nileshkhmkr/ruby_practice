require_relative 'Validator'

module Teams
  include Validator

  def select_team(teams,whose)
    puts "\n"
    puts "Please select #{whose.capitalize} team"

    t = teams.keys
    teams_string = "'" + t.join("' or '") + "'"
    team = get_valid_input(false, "Please enter #{teams_string} : ", false, "Wrong choice entered! Please try again.", t, false)
    team = team.upcase

    puts "\n"
    puts "Selected team is #{team}"
    if(whose == 'your')
      @your_team = team
    else
      @opponent_team = team
    end

    return team
  end

  def select_players
  end

  def choose_captain
  end

  def display_team(team_lable, team)
    puts "\n"
    puts team_lable + " : " + team
    puts "Team name :" + team['name']
    puts "Captain :" + team['captain']
    team['players'].each do |name, role|
      puts "#{name} => #{role}"
    end
  end
  
end