#function to get input value
def get_input()
    input = gets.chomp
    check_input(input)
end

#funtion to check input and call logic methods
def check_input(input)
    inp = input.to_i

    if (inp != 0 && (inp.is_a? Integer) && (inp <= 10 && inp >= 1))
        puts "Thanks you have entered " + input

        left_simple_triangle(input.to_i)
        left_reverse_triangle(input.to_i)
        simple_triangle(input.to_i)
        reverse_triangle(input.to_i)
        right_simple_triangle(input.to_i)
        right_reverse_triangle(input.to_i)
    else
        puts "Sorry you entered '#{input}'! please enter a valid number between 1 to 10 :"
        get_input
    end
end

#logic for left simple traingle
def left_simple_triangle(input)
    i = 1
    n = input
    while i <= n
        puts "* " * i
        i += 1
    end
    puts "\n"
end

#logic for left reverse traingle
def left_reverse_triangle(input)
    i = 1
    n = input
    while i <= n
        puts "* " * n
        n -= 1
    end
    puts "\n"
end

#logic for right simple traingle
def right_simple_triangle(input)
    i = 1
    j = input - 1
    n = input
    while i <= n
        print "  " * j
        print "* " * i
        print "\n"
        i += 1
        j -= 1
    end
    puts "\n"
end

#logic for right reverse traingle
def right_reverse_triangle(input)
    i = 1
    j = 0
    n = input
    while i <= n
        print "  " * j
        print "* " * n
        print "\n"
        n -= 1
        j += 1
    end
    puts "\n"
end

#logic for simple traingle
def simple_triangle(input)
    i = 1
    j = input - 1
    n = input
    while i <= n
        print " " * j
        print "* " * i
        print "\n"
        i += 1
        j -= 1
    end
    puts "\n"
end

#logic for reverse traingle
def reverse_triangle(input)
    i = 1
    j = 0
    n = input
    while i <= n
        print " " * j
        print "* " * n
        print "\n"
        n -= 1
        j += 1
    end
    puts "\n"
end
    
#read test art file and print
art = File.read("art.txt")
puts art

#add some blank spaces
puts "\n"

#some basic pattern printing programs
puts "Please enter a number for pattern printing between 1 to 10 : "

#get input and validate
get_input
