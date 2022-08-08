require_relative 'Validator'

module Match
  include Validator
  
  def select_match_type(match_types)
  end
    
  def toss
    puts "Let's toss a coin, select your side of coin."

    coin = ["H", "T"]
    coin_side = get_valid_input(
      false,
      "Please enter 'H' or 'T' : ",
      false,
      "Wrong choice entered! Please try again.",
      coin,
      false
    )

  end

  def choose_bating_fielding
  end

  def inning
  end

  def batting
  end

  def balling
  end

end