require_relative 'Validator'

module Match
  include Validator
  
  def select_match_type(match_types)
  end
    
  def toss
    puts "Let's toss a coin, select your side of coin."
    coin_side = get_valid_input(
      false,
      Please enter 'H' or 'T' :,
      "You have entered : {{input}}",
      "Wrong choice entered! Please try again.",
      should_match_to = ["h","t"],
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