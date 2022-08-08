module Validator

  def get_valid_input(
    numeric_input = false,
    input_label,
    success_msg,
    failure_msg,
    should_match_to = [],
    case_sensetive = false
  )
    puts input_label
    input = gets.chomp

    if(numeric_input == true)

    end

    if(coin_side.casecmp('H') != 0 && coin_side.casecmp('T') != 0)
      puts failure_msg
      get_valid_input(numeric_input, input_label, success_msg, failure_msg, should_match_to, case_sensetive)
    else
      puts success_msg + input 
      return input
    end
  end

end