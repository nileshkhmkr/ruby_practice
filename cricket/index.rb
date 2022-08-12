require_relative 'modules/Validator'
require_relative 'modules/Teams'
require_relative 'modules/Match'
require_relative 'modules/Scoreboard'

class Cricket

  include Teams
  include Match
  include Scoreboard

  $lines = "--------------------------------------"

  #constructor method
  def initialize
    #set all the instance variables
    @match_types = {
      "T20" => {
        "innings" => 2,
        "overs" => 3,
      },
      "ODI" => {
        "innings" => 2,
        "overs" => 5,
      },
      "TEST" => {
        "innings" => 4,
        "overs" => 20,
      }
    }

    @teams = {
      "MI" => {
        "name" => "Mumbai Indians",
        "joursey_color" => "Blue",
        "tournaments_won" => "5 Times",
        "owner" => "Neeta Ambani",
        "captain" => "Rohit Sharma",
        "players" => {
          "Rohit Sharma"        => "Batsman",
          "Suryakumar Yadav"    => "Batsman",
          "Ishan Kishan"        => "Batsman",
          "Tilak Varma"         => "Batsman",
          "Ramandeep Singh"     => "Batsman",
          "Dewald Brevis"       => "Batsman",
          "Kieron Pollard"      => "All-rounder",
          "Hrithik Shokeen"     => "All-rounder",
          "Sanjay Yadav"        => "All-rounder",
          "Daniel Sams"         => "All-rounder",
          "Tim David"           => "All-rounder",
          "Fabian Allen"        => "All-rounder",
          "Jasprit Bumrah"      => "Bowler",
          "Jofra Archer"        => "Bowler",
          "Jaydev Unadkat"      => "Bowler",
          "Mayank Markande"     => "Bowler",
          "Murugan Ashwin"      => "Bowler",
          "Basil Thampi"        => "Bowler",
        }
      },
      "CSK" => {
        "name" => "Chennai Super Kings",
        "joursey_color" => "Yellow",
        "tournaments_won" => "4 Times",
        "owner" => "India Cements",
        "captain" => "M S Dhoni",
        "players" => {
          "M S Dhoni"           => "Batsman",
          "Ruturaj Gaikwad"     => "Batsman",
          "Robin Uthappa"       => "Batsman",
          "Ambati Rayudu"       => "Batsman", 
          "Devon Conway"        => "Batsman",
          "Subhranshu Senapati" => "Batsman",
          "Ravindra Jadeja"     => "All-rounder",
          "Moeen Ali"           => "All-rounder",
          "Dwayne Bravo"        => "All-rounder",
          "Shivam Dube"         => "All-rounder",
          "Dwaine Pretorius"    => "All-rounder",
          "Bhagath Varma"       => "All-rounder",
          "Deepak Chahar"       => "Bowler",
          "KM Asif"             => "Bowler",
          "Tushar Deshpande"    => "Bowler",
          "Maheesh Theekshana"  => "Bowler",
          "Simranjeet Singh"    => "Bowler",
          "Matheesha Pathirana" => "Bowler",
        }
      },
      "KKR" => {
        "name" => "Kolkata Knight Riders",
        "joursey_color" => "Purple",
        "tournaments_won" => "2 Times",
        "owner" => "Shahrukh Khan",
        "captain" => "Shreyas Iyer",
        "players" => {
          "Shreyas Iyer"        => "Batsman",
          "Nitish Rana"         => "Batsman",
          "Ajinkya Rahane"      => "Batsman",
          "Rinku Singh"         => "Batsman",
          "Abhijeet Tomar"      => "Batsman",
          "Pratham Singh"       => "Batsman",
          "Andre Russell"       => "All-rounder",
          "Venkatesh Iyer"      => "All-rounder",
          "Sunil Narine"        => "All-rounder",
          "Anukul Roy"          => "All-rounder",
          "Mohammad Nabi"       => "All-rounder",
          "Varun Chakravarty"   => "Bowler",
          "Pat Cummins"         => "Bowler",
          "Rasikh Dar"          => "Bowler",
          "Ashok Sharma"        => "Bowler",
          "Tim Southee"         => "Bowler",
          "Umesh Yadav"         => "Bowler",
        }
      },
      "SRH" => {
        "name" => "Sunrisers Hyderabad",
        "joursey_color" => "Orange",
        "tournaments_won" => "1 Times",
        "owner" => "Kalanithi Maran",
        "captain" => "Kane Williamson",
        "players" => {
          "Kane Williamson"     => "Batsman",
          "Aiden Markram"       => "Batsman",
          "Shashank Singh"      => "Batsman",
          "R Samarth"           => "Batsman",
          "Rahul Tripathi"      => "Batsman",
          "Priyam Garg"         => "Batsman",
          "Abdul Samad"         => "All-rounder",
          "Marco Jansen"        => "All-rounder",
          "Sean Abbott"         => "All-rounder",
          "Abhishek Sharma"     => "All-rounder",
          "Washington Sundar"   => "All-rounder",
          "Bhuvneshwar Kumar"   => "Bowler",
          "T Natarajan"         => "Bowler",
          "Kartik Tyagi"        => "Bowler",
          "Shreyas Gopal"       => "Bowler",
          "Umran Malik"         => "Bowler",
          "Saurabh Dubey"       => "Bowler",
        }
      },
    }

    @probablities = {
      "0" => {"label" => "Dot ball", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "1" => {"label" => "1 run", "runs" => 1, "ball_count" => 1, "pitch_cross" => true, "out" => false, "extras" => 0},
      "2" => {"label" => "2 runs", "runs" => 2, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "3" => {"label" => "3 runs", "runs" => 3, "ball_count" => 1, "pitch_cross" => true, "out" => false, "extras" => 0},
      "4" => {"label" => "Four", "runs" => 4, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "6" => {"label" => "Six", "runs" => 6, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "Nb" => {"label" => "No ball", "runs" => 1, "ball_count" => 0, "pitch_cross" => false, "out" => false, "extras" => 1},
      "Nb+1" => {"label" => "No ball + 1 run", "runs" => 2, "ball_count" => 0, "pitch_cross" => true, "out" => false, "extras" => 2},
      "Nb+2" => {"label" => "No ball + 2 run", "runs" => 3, "ball_count" => 0, "pitch_cross" => false, "out" => false, "extras" => 3},
      "Nb+3" => {"label" => "No ball + 3 run", "runs" => 4, "ball_count" => 0, "pitch_cross" => true, "out" => false, "extras" => 4},
      "Nb+4" => {"label" => "No ball + Four", "runs" => 5, "ball_count" => 0, "pitch_cross" => false, "out" => false, "extras" => 6},
      "Nb+6" => {"label" => "No ball + Six", "runs" => 7, "ball_count" => 0, "pitch_cross" => false, "out" => false, "extras" => 7},
      "Wd" => {"label" => "Wide", "runs" => 1, "ball_count" => 0, "pitch_cross" => false, "out" => false, "extras" => 1},
      "By" => {"label" => "Bye", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "Lb" => {"label" => "leg bye", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => false, "extras" => 0},
      "LBW" => {"label" => "LBW out", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => true, "extras" => 0},
      "RO" => {"label" => "Run out", "runs" => 0, "ball_count" => 1, "pitch_cross" => true, "out" => true, "extras" => 0},
      "C" => {"label" => "Catch out", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => true, "extras" => 0},
      "HW" => {"label" => "Hit wicket", "runs" => 0, "ball_count" => 1, "pitch_cross" => false, "out" => true, "extras" => 0},
    }

    @game_type =""
    @match_type = ""
    @your_team = {"team" => "", "name" => "", "captain" => "", "players" => {}}
    @opponent_team = {"team" => "", "name" => "", "captain" => "", "players" => {}}
    @toss = ""
    @batting_team = ""
    @total_innings = 0
    @overs_per_inning = 0
    @wickets_per_inning = 10
    @innings = {}

    #start the game now by choosing game_type (i.e. Quick game or Custom game)
    start_game
  end
  #constructor ends here

  def start_game
    puts "Welcome to Cricket League 2022"
    select_game_type
  end

  def select_game_type
    puts "Please select game type :  Q => Quick game    C => Custom game"

    game_types = ["Q", "C"]
    selected_game_type = get_valid_input(false, "Please enter 'Q' or 'C' : ", false, "Wrong choice entered! Please try again.", game_types, false)

    if(selected_game_type.upcase == "Q")
      puts "You have selected Quick game"
      @game_type = "Quick"
      quick_game
    else
      puts "You have selected Custom game"
      @game_type = "Custom"
      custom_game
    end
  end

  def quick_game
    @match_type = "T20"
    @total_innings    = 2
    @overs_per_inning = 3

    @your_team = {
      "team" => "MI",
      "name" => "Mumbai Indians",
    }
    auto_select_players_and_captain(@your_team,"your")

    @opponent_team = {
      "team" => "CSK",
      "name" => "Chennai Super Kings",
    }
    auto_select_players_and_captain(@opponent_team,"opponent")

    match_flow
  end

  def custom_game
    select_match_type(@match_types)

    select_team(@teams,"your")
    select_players(@your_team,"your")
    choose_captain(@your_team,"your")

    puts $lines
    select_team(@teams,"opponent")
    auto_select_players_and_captain(@opponent_team,"opponent")

    match_flow
  end

  def match_flow
    puts $lines
    display_team("Your team", @your_team)
    display_team("Opponent team", @opponent_team)

    puts $lines
    toss
    after_toss

    puts $lines
    show_line_ups(@your_team)
    show_line_ups(@opponent_team)

    puts $lines
    start_match

    puts $lines
    match_results
  end

end

# create instance of Cricket class
Cricket.new()