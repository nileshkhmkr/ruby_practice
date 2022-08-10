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

  def match_criterias
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
      @bat_field = "field"
    end
    return @toss
  end

  def after_toss
    if(@toss == "won")
      choose_bating_fielding
    else
      make_balling_lineup
    end
  end

  def choose_bating_fielding
    puts "\n"
    puts "Please choose you want to 'Bat' or 'Field' first ( Enter B or F ) :"

    opts = ["B", "F"]
    opted_to = get_valid_input(false, "Please enter 'B' or 'F' : ", false, "Wrong choice entered! Please try again.", opts, false)
     
    puts "\n"
    if(opted_to.upcase == "B")
      puts "You have opted to 'Bat' first."
      @bat_field = "bat"
      make_bat_lineup
    else
      puts "You have opted to 'Field' first."
      @bat_field = "field"
      make_balling_lineup
    end
  end

  def make_bat_lineup
    puts "\n"
    puts "Please Choose your batting line-up : "
  end

  def make_balling_lineup
    puts "\n"
    puts "Please Choose your balling line-up : "
  end

  def inning(number)
  end

end