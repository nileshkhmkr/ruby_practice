module Scoreboard

  def display_scoreboard(inning)
    puts "\n"
    puts "Scoreboard for inning #{inning} : "
    puts "Total runs : #{@innings[inning]['runs']}"
    puts "Total overs : #{@innings[inning]['overs']}"
    puts "Wickets gone : #{@innings[inning]['wickets']}"
    puts "Extra : #{@innings[inning]['extras']}"
    puts "Runrate : #{calculate_runrate(@innings[inning]['runs'], @innings[inning]['overs'])}"
  end

  def display_overs(inning)
    puts "\n"
    puts "Overs in inning #{inning} : "
    @innings[inning]['timeline'].each do |o, t|
      puts "#{o} : #{t}"
    end
  end

  def display_result
  end

  def projected_runs
  end

  def required_runs(runs, balls)
    puts "\n"
    puts "Runs required to win #{runs} in #{balls} balls"
  end

  def current_runrate
    puts "\n"
    puts "Current runrate : "
  end

  def required_runrate
    puts "\n"
    puts "Required runrate : "
  end
    
  def calculate_runrate(runs, overs)
    runs / overs
  end
end