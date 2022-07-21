#class for dictionary demo
class Fruit
    # adding members
    $fruits = {}
    $action = 0

    # some reusable variables
    $br     = "\n"
    $thr    = "_____________________________________"
    $tr     = "-------------------------------------"
    $head   = "Sr.| Name     | Color  | Price "
    $line   = "======================================="

    #constructor method
    def initialize()
        # initial records in dictionary
        $fruits = [{"name" => "apple",
            "color" => "red",
            "price" => "200"}]
    end

    #method for selecting actions
    def actions()
        puts $br
        puts "enter your choice from : [1]=> Create, [2]=> Update, [3]=> Delete, [4]=> Search, [5]=> Exit"
        $action = gets.chomp
        check_input($action)
    end

    #funtion to check input and call logic methods
    def check_input(input)
        inp = input.to_i

        # validate the input
        if (inp != 0 && (inp.is_a? Integer))
            puts "Thanks you have entered #{inp}."
            switch_action(inp)
        else
            puts "Sorry you entered '#{input}'! please enter a valid choice"
            actions
        end
    end

    # function to switch between actions or exiting application
    def switch_action(choice)
        case choice
        when 1
            create
        when 2
            update
        when 3
            delete
        when 4
            search
        when 5
            puts "Exiting... Have a good day!"
            exit
        else
            puts "Sorry you entered '#{choice}'! please enter a valid choice"
            actions
        end
    end

    # listing all the records
    def list()
        puts "List of fruits : "
        puts $thr
        puts $head
        puts $thr

        # iterating through $fruits array of hashes
        $fruits.each_with_index do |fruit, i|
            puts " #{i + 1} | #{fruit["name"]}    | #{fruit["color"]}   | #{fruit["price"]}"
            puts $tr
        end
        actions
    end

    # creating new record
    def create
        puts $br

        # get the inputs
        puts "Please enter name of fruit :"
        fname = gets.chomp

        puts "Please enter fruit color :"
        fcolor = gets.chomp

        puts "Please enter fruit price :"
        fprice = gets.chomp

        # prepare new hash to insert in $fruits array
        new_fruit = {"name" => fname, "color" => fcolor, "price" => fprice}
        $fruits.push(new_fruit)

        puts $br
        list
    end

    # updating existing record
    def update
        puts $br
        puts "Please enter index of fruit, which is to be edited :"
        i = gets.chomp.to_i

        # validate index number intered
        if (i != 0 && (i.is_a? Integer))
            i = i - 1

            # check if any value really exist for that index
            if($fruits[i] == nil)
                puts "Fruit for this index not found, please try again."
                update
            end
        else
            puts "Index should be numeric, please try again."
            update
        end

        # get the new inputs
        puts "Please enter name of fruit :"
        fname = gets.chomp

        puts "Please enter fruit color :"
        fcolor = gets.chomp

        puts "Please enter fruit price :"
        fprice = gets.chomp

        # prepare new hash to replaced with existing one in $fruits array
        updated_fruit = {"name" => fname, "color" => fcolor, "price" => fprice}
        $fruits[i] = updated_fruit

        puts $br
        list
    end

    # deleting a record
    def delete
        puts $br
        puts "Please enter index of fruit, which is to be deleted :"
        i = gets.chomp.to_i

        # validate index number intered
        if (i != 0 && (i.is_a? Integer))
            i = i - 1

            # check if any value really exist for that index
            if($fruits[i] == nil)
                puts "Fruit for this index not found, please try again."
                delete
            end
        else
            puts "Index should be numeric, please try again."
            delete
        end

        # delete that index hash from array
        $fruits.delete_at(i)

        puts $br
        list
    end

    # search for a record with provided keyword
    def search
        puts $br
        puts "Please enter name or color or price of fruit to search :"
        keyword = gets.chomp
        
        # validate keyword
        if(keyword == "" || keyword == nil)
            puts "Please enter some valid keywords to search"
            search
        end

        # match keyword with all the values existing in array of hash and ignore case
        element = $fruits.find{ |ele| ele["name"].casecmp(keyword)==0 || ele["color"].casecmp(keyword)==0 || ele["price"].casecmp(keyword)==0}

        if(element == nil)
            puts "No records found for entered keyword. please try again"
            search
        else
            puts $br
            puts "Record found for the keyword."
            puts "Name : #{element["name"]}, Color : #{element["color"]}, Price : #{element["price"]}"
            actions
        end

    end

end

# create instance of class and call the listing method
fr = Fruit.new
fr.list