require_relative 'Teams'
require_relative 'Match'

module Scoreboard

  include Teams
  include Match

  def display_inning_details(inning)
    puts "\n"
    puts "----Inning number #{inning}----"
    puts "Batting Team : #{@innings[inning]['batting']}"
  end

  def display_scoreboard(inning)
    puts "\n"
    puts "Scoreboard for inning #{inning} : "
    puts "Total runs : #{@innings[inning]['runs']}"
    puts "Total overs : #{@innings[inning]['overs'].round(1)}"
    puts "Wickets gone : #{@innings[inning]['wickets']}"
    puts "Extra : #{@innings[inning]['extras']}"
    puts "Runrate : #{calculate_runrate(@innings[inning]['runs'], @innings[inning]['overs'])}"
    puts $lines
  end

  def display_overs(inning)
    puts "\n"
    puts "Overs in inning #{inning} : "
    @innings[inning]['timeline'].each do |o, t|
      puts "#{o} : #{t['deliveries']} ---- (This over #{t['over_runs']}/#{t['over_wickets']})  Total #{t['runs']}/#{t['wickets']}"
    end
  end

  def display_result(innings)
    puts "\n"
    puts $lines
    if(@match_type.upcase != "TEST")
      if (innings[1]['runs'] > innings[2]['runs'])
        puts "#{innings[1]['batting'] } won the match by #{innings[1]['runs'] - innings[2]['runs']} runs"
      elsif(innings[1]['runs'] < innings[2]['runs'])
        puts "#{innings[2]['batting'] } won the match by #{11 - innings[2]['wickets']} wickets (in #{innings[2]['overs'].round(1)} overs)"
      else
        puts "Match is tied between both the teams with similar runs - #{innings[1]['runs']}"
      end
    else
      if ((innings[1]['runs'] + innings[3]['runs']) > (innings[2]['runs'] + innings[4]['runs']))
        puts "#{innings[1]['batting'] } won the match by #{innings[1]['runs'] - innings[2]['runs']} runs"
      elsif((innings[1]['runs'] + innings[3]['runs']) < (innings[2]['runs'] + innings[4]['runs']))
        puts "#{innings[2]['batting'] } won the match by #{(innings[2]['runs'] + innings[4]['runs']) - (innings[1]['runs'] + innings[3]['runs'])} runs"
      else
        puts "Match is tied between both the teams with similar runs - #{innings[1]['runs'] + innings[3]['runs']}"
      end
    end
    puts $lines
  end

  def required_runs(runs, balls)
    puts "\n"
    puts "Runs required to win #{runs} in #{balls} balls"
  end
    
  def calculate_runrate(runs, overs)
    runrate = runs.to_f / overs
    return runrate.round(2)
  end

  def write_results_to_file(teams_file, scoreboard_file)
    old_stdout = $stdout
    File.open(teams_file, "w+") do |i|
      $stdout = i
      display_team("Your team", @your_team)
      display_team("Opponent team", @opponent_team)
      i.puts $lines
      show_line_ups(@your_team)
      show_line_ups(@opponent_team)
    end
    $stdout = old_stdout

    old_stdout = $stdout
    File.open(scoreboard_file, "w+") do |i|
      $stdout = i
      puts "Match type : #{@match_type}"
      if(@toss == "lost")
        puts "#{@opponent_team['team']} have won toss and have elected to Bat first"
      else
        puts "Your team have won the toss"
        if(@innings[1]['batting'] == @your_team['team'])
          puts "And have elected to Bat first"
        else
          puts "And have elected to Field first"
        end
      end

      i = 1
      while i <= @total_innings
        display_inning_details(i)
        display_overs(i)
        display_scoreboard(i)
        i += 1
      end
      display_result(@innings)
    end
    $stdout = old_stdout

  end
end