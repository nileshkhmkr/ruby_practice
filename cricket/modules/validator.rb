module Validator

  def get_valid_input(
    numeric_input = false,
    input_label,
    success_msg,
    failure_msg,
    should_match_to,
    case_sensetive
  )
    puts input_label
    input = gets.chomp
    error = false

    if(numeric_input == true)
      input = input.to_i
      if(input.is_a? Integer != true)
        "Entered value is not an integer! please try again..."
        error = true
        input = get_valid_input(numeric_input, input_label, success_msg, failure_msg, should_match_to, case_sensetive)
      end
    end

    if(should_match_to)
      if(case_sensetive)
        if(!should_match_to.include?(input))
          puts failure_msg
          error = true
          input = get_valid_input(numeric_input, input_label, success_msg, failure_msg, should_match_to, case_sensetive)
        end
      else
        if(should_match_to.select{|i| i.downcase == input.downcase} == [])
          puts failure_msg
          error = true
          input = get_valid_input(numeric_input, input_label, success_msg, failure_msg, should_match_to, case_sensetive)
        end
      end
    end

    if(error = false)
      puts "You have entered : " + input 
      if success_msg
        puts success_msg
      end
    end
    return input
  end

end