require_relative 'Validator'

module Match
  include Validator
  
  def select_match_type(match_types)
    puts "\n"
    puts "Please select match type"

    types = match_types.keys
    types_string = "'" + types.join("' or '") + "'"
    type = get_valid_input(false, "Please enter #{types_string} : ", false, "Wrong choice entered! Please try again.", types, false)
    type = type.upcase

    puts "\n"
    puts "Selected match type is #{type}"

    @match_type       = type
    @total_innings    = match_types[type]['innings']
    @overs_per_inning = match_types[type]['overs']

    return @match_type
  end
    
  def toss
    puts "\n"
    puts "Let's toss a coin, select your side of coin."

    coin = ["H", "T"]
    coin_side = get_valid_input(false, "Please enter 'H' or 'T' : ", false, "Wrong choice entered! Please try again.", coin, false)

    puts "\n"

    tossed = coin.sample
    if(coin_side.downcase == tossed.downcase)
      puts "Congrats you have won the toss!"
      @toss = "won"
    else
      puts "Opponent team have won the tossed and choosed to 'Bat' first"
      @toss = "lost"
      @batting_team = "opponent"
    end
    return @toss
  end

  def after_toss
    if(@toss == "won")
      choose_bating_fielding
    end

    make_batting_lineup
    make_balling_lineup
  end

  def choose_bating_fielding
    puts "\n"
    puts "Please choose you want to 'Bat' or 'Field' first ( Enter B or F ) :"

    opts = ["B", "F"]
    opted_to = get_valid_input(false, "Please enter 'B' or 'F' : ", false, "Wrong choice entered! Please try again.", opts, false)
     
    puts "\n"
    if(opted_to.upcase == "B")
      puts "You have opted to 'Bat' first."
      @batting_team = "your"
    else
      puts "You have opted to 'Field' first."
      @batting_team = "opponent"
    end
  end

  def make_batting_lineup
    puts "\n"
    puts "Please Choose your batting line-up : "

    puts "Do want to keep the current default lineup for Batting? :"
    opts = ["Y", "N"]
    ok_with_current_lineup = get_valid_input(false, "Please enter 'Y' or 'N' : ", false, "Wrong choice entered! Please try again.", opts, false)
    
    if(ok_with_current_lineup.upcase == "Y")
      @your_team['batting_lineup'] = [0,1,2,3,4,5,6,7,8,9,10]
    else
      @your_team['batting_lineup'] = choose_lineup(11, @your_team['players'], [0,1,2,3,4,5,6,7,8,9,10])
    end
  end

  def make_balling_lineup
    puts "\n"
    puts "Please Choose your balling line-up : "

    puts "Do want to keep the current default lineup for Balling? :"
    opts = ["Y", "N"]
    ok_with_current_lineup = get_valid_input(false, "Please enter 'Y' or 'N' : ", false, "Wrong choice entered! Please try again.", opts, false)
    
    if(ok_with_current_lineup.upcase == "Y")
      @your_team['balling_lineup'] = [7,8,9,10,4,5,6]
    else
      @your_team['balling_lineup'] = choose_lineup(7, @your_team['players'], [4,5,6,7,8,9,10])
    end
  end

  def choose_lineup(limit, players, allowed_players)
    puts "\n"
    puts "Please enter #{limit} number of players from provided list of with your preference : "
    i = 1
    allowed_players.each do |i|
      # if(allowed_players.include?(i-1))
        puts "#{i + 1}) " + players.keys[i]
        # i += 1
      # end
    end
    puts "please enter in single line and comma separated (e.g. 1,2,4,5) : "

    input = gets.chomp
    input_array = input.split(/,/)
    input_array = input_array.uniq()

    if(input_array.count != limit)
      puts "Please enter exactly #{limit} number of players, try again.."
      choose_lineup(limit, players, allowed_players)
    else
      chosen_players = []

      input_array.each do |i|
        inp = i.chomp.to_i
        if (inp != 0 && (inp.is_a? Integer))
          if(allowed_players.include?(inp-1))
            chosen_players.push(inp-1)
          else
            puts "No player is available for chosen number #{inp}, try again.."
            chosen_players = choose_lineup(limit, players, allowed_players)
          end
        else
          puts "All the choices should numeric values provided for player, try again.."
          chosen_players = choose_lineup(limit, players, allowed_players)
        end
      end

      return chosen_players
    end

  end

  def show_line_ups(team)
    puts "\n"
    puts "Batting line-up of team #{team['name']} : "
    i = 1
    team['batting_lineup'].each do |k|
      puts "#{i}) " + team['players'].keys[k]
      i += 1
    end

    puts "\n"
    puts "Balling line-up of team #{team['name']} : "
    i = 1
    team['balling_lineup'].each do |k|
      puts "#{i}) " + team['players'].keys[k]
      i += 1
    end
  end

  def start_match
    puts "\n"
    puts "Starting Match......"

    i = 1
    while i <= @total_innings
      inning(i)

      display_overs(i)
      display_scoreboard(i)

      i += 1
    end

    display_result
  end

  def inning(inn)
    puts "\n"
    puts "----Inning number #{inn}----"

    @innings[inn] = {}
    if(@batting_team == "your")
      @innings[inn]['batting'] = @your_team['team']
      @innings[inn]['balling'] = @opponent_team['team']
    else
      @innings[inn]['batting'] = @opponent_team['team']
      @innings[inn]['balling'] = @your_team['team']
    end
    
    puts "Batting Teams : #{@innings[inn]['batting']}"
    
    @innings[inn]['runs'] = 0
    @innings[inn]['extras'] = 0
    @innings[inn]['wickets'] = 0
    @innings[inn]['overs'] = 0.0
    @innings[inn]['timeline'] = {}
    
    over = 1
    while over <= @overs_per_inning
      if @innings[inn]['wickets'] == @wickets_per_inning
        break
      end

      over_name = "Over #{over}"
      @innings[inn]['timeline'][over_name] = []

      ball = 1
      # 6 balls per over
      while ball <= 6
        if @innings[inn]['wickets'] == @wickets_per_inning
          break
        end

        delivery = @probablities.keys.sample
        @innings[inn]['timeline'][over_name].push(delivery)

        # add runs
        if(@probablities[delivery]['runs'] != 0)
          @innings[inn]['runs'] += @probablities[delivery]['runs']
        end

        # add extras in count
        if(@probablities[delivery]['extras'] != 0)
          @innings[inn]['extras'] += @probablities[delivery]['extras']
        end

        # add wickets
        if(@probablities[delivery]['out'] == true)
          @innings[inn]['wickets'] += 1
        end

        # check if ball is counted
        if(@probablities[delivery]['ball_count'] == 1)
          ball += 1
          @innings[inn]['overs'] += 0.1
        end
      end

      @innings[inn]['overs'] = over
      over += 1
    end
  end

  def match_results
  end

end