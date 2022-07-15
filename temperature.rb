calculate = Proc.new { |f| (f.to_i - 32)/1.8 }

puts "Please enter temperature in fahrenheit : "

input = gets

if (input == "q" || input == "Q")
    puts "quitting the application"
else
    cal = calculate.call(input)
    puts "the temperature in celcius is : #{cal.to_i}."
end