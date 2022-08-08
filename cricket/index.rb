require_relative 'modules/Validator'
require_relative 'modules/Teams'
require_relative 'modules/Match'
require_relative 'modules/Scoreboard'

class Cricket

  include Teams
  include Match
  include Scoreboard

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
      "Test" => {
        "innings" => 4,
        "overs" => 0,
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

    @game_type =""
    @match_type = ""
    @your_team = {}
    @opponent_team = {}

    #start the game now by choosing game_type (i.e. Quick game or Custom game)
    start_game
  end
  #constructor ends here

  def start_game
    puts "Welcome to Cricket League 2022"
    toss
  end

  def quick_game
  end

  def custom_game
    select_match_type
    select_team
    select_players
    toss
  end

  def configure_match
  end

end

# create instance of Cricket class
Cricket.new()