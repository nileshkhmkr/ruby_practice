require_relative 'Validator'

module Teams
  include Validator

  def select_team(teams, whose)
    puts "\n"
    puts "Please select #{whose.capitalize} team"

    t = teams.keys
    teams_string = "'" + t.join("' or '") + "'"
    team = get_valid_input(false, "Please enter #{teams_string} : ", false, "Wrong choice entered! Please try again.", t, false)
    team = team.upcase

    puts "\n"
    puts "Selected team is #{team} (#{teams[team]['name']})"
    if(whose == 'your')
      @your_team['team'] = team
      @your_team['name'] = teams[team]['name']
    else
      @opponent_team['team'] = team
      @opponent_team['name'] = teams[team]['name']
    end

    return team
  end

  def select_players(team, whose)
    t = team['team']
    t_name = team['name']
    total_batsmen     = @teams[t]["players"].select { |k,v| v == "Batsman" }
    total_all_rounder = @teams[t]["players"].select { |k,v| v == "All-rounder" }
    total_bowler      = @teams[t]["players"].select { |k,v| v == "Bowler" }

    batsmen     = choose_players("Batsmen", 4, total_batsmen)
    all_rounder = choose_players("All-rounder", 3, total_all_rounder)
    bowler      = choose_players("Bowler", 4, total_bowler)

    players = {}
    batsmen.first(4).each do |k, v|
      players[k] = v
    end
    all_rounder.first(4).each do |k, v|
      players[k] = v
    end
    bowler.first(4).each do |k, v|
      players[k] = v
    end

    if(whose == 'your')
      @your_team['players'] = players
    else
      @opponent_team['players'] = players
    end
  end

  def choose_players(label, limit, players)
    puts "\n"
    puts "Please select any #{limit} #{label} from provided list of #{label} : "
    i = 1
    players.each do |k, v|
      puts "#{i}) " + k
      i += 1
    end
    puts "please enter in single line and comma separated (e.g. 1,2,4,5) : "

    input = gets.chomp
    input_array = input.split(/,/)
    input_array = input_array.uniq()

    if(input_array.count != limit)
      puts "Please exactly #{limit} #{label}, try again.."
      choose_players(label, limit, players)
    else
      chosen_players = {}

      input_array.each do |i|
        inp = i.chomp.to_i
        if (inp != 0 && (inp.is_a? Integer))
          if(players.keys[inp-1] != nil)
            key = players.keys[inp-1]
            value = players.values[inp-1]

            chosen_players[key] = value
          else
            puts "No player is available for chosen number #{inp}, try again.."
            chosen_players = choose_players(label, limit, players)
          end
        else
          puts "All the choices should numeric values provided for player, try again.."
          chosen_players = choose_players(label, limit, players)
        end
      end

      return chosen_players
    end
  end

  def choose_captain(team, whose)
    puts "\n"
    puts "Please select a captain from provided list of players : "
    i = 1
    players = team['players']
    players.each do |k, v|
      puts "#{i}) " + k
      i += 1
    end
    puts "please enter the number of player : "

    input = gets.chomp.to_i
    if (input != 0 && (input.is_a? Integer))
      if(players.keys[input-1] != nil)
        chosen_captain = players.keys[input-1]
      else
        puts "No player is available for chosen number #{input}, try again.."
        chosen_captain = choose_captain(team, whose)
      end
    else
      puts "Please enter numeric value provided for player, try again.."
      chosen_captain = choose_captain(team, whose)
    end

    if(whose == 'your')
      @your_team['captain'] = chosen_captain
    else
      @opponent_team['captain'] = chosen_captain
    end
  end

  def auto_select_players_and_captain(team, whose)
    t = team['team']
    t_name = team['name']
    batsmen     = @teams[t]["players"].select { |k,v| v == "Batsman" }
    all_rounder = @teams[t]["players"].select { |k,v| v == "All-rounder" }
    bowler      = @teams[t]["players"].select { |k,v| v == "Bowler" }

    players = {}
    batsmen.first(4).each do |k, v|
      players[k] = v
    end
    all_rounder.first(3).each do |k, v|
      players[k] = v
    end
    bowler.first(4).each do |k, v|
      players[k] = v
    end
    
    if(whose == 'your')
      @your_team['captain'] = players.keys[0]
      @your_team['players'] = players
      @your_team['batting_lineup'] = [0,1,2,3,4,5,6,7,8,9,10]
      @your_team['balling_lineup'] = [7,8,9,10,4,5,6]
    else
      @opponent_team['captain'] = players.keys[0]
      @opponent_team['players'] = players
      @opponent_team['batting_lineup'] = [0,1,2,3,4,5,6,7,8,9,10]
      @opponent_team['balling_lineup'] = [7,8,9,10,4,5,6]
    end
  end

  def display_team(team_lable, team)
    puts "\n"
    puts team_lable + " : " + team['team']
    puts "Team name :" + team['name']
    puts "Captain :" + team['captain']
    i = 1
    team['players'].each do |name, role|
      puts "#{i}) #{name} => #{role}"
      i += 1
    end
  end
  
end