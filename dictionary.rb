#class for dictionary demo
class Fruit
    $fruits = {}
    $action = 5
    $br     = "\n"
    $thr    = "_____________________________________"
    $tr     = "-------------------------------------"
    $head   = "Sr.| Name     | Color  | Price "
    $line   = "======================================="

    #constructor method
    def initialize()
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

        if (inp != 0 && (inp.is_a? Integer))
            puts "Thanks you have entered #{inp}."
            switch_action(inp)
        else
            puts "Sorry you entered '#{input}'! please enter a valid choice"
            actions
        end
    end

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

    def list()
        puts "List of fruits : "
        puts $thr
        puts $head
        puts $thr
        $fruits.each_with_index do |fruit, i|
            puts " #{i + 1} | #{fruit["name"]}    | #{fruit["color"]}   | #{fruit["price"]}"
            puts $tr
        end
        actions
    end

    def create
        puts $br
        puts "Please enter name of fruit :"
        fname = gets.chomp

        puts "Please enter fruit color :"
        fcolor = gets.chomp

        puts "Please enter fruit price :"
        fprice = gets.chomp

        new_fruit = {"name" => fname, "color" => fcolor, "price" => fprice}
        $fruits.push(new_fruit)

        puts $br
        list
    end

    def update
        puts $br
        puts "Please enter index of fruit, which is to be edited :"
        i = gets.chomp.to_i

        if (i != 0 && (i.is_a? Integer))
            i = i - 1
            if($fruits[i] == nil)
                puts "Fruit for this index not found, please try again."
                update
            end
        else
            puts "Index should be numeric, please try again."
            update
        end

        puts "Please enter name of fruit :"
        fname = gets.chomp

        puts "Please enter fruit color :"
        fcolor = gets.chomp

        puts "Please enter fruit price :"
        fprice = gets.chomp

        updated_fruit = {"name" => fname, "color" => fcolor, "price" => fprice}
        $fruits[i] = updated_fruit

        puts $br
        list
    end

    def delete
        puts $br
        puts "Please enter index of fruit, which is to be deleted :"
        i = gets.chomp.to_i

        if (i != 0 && (i.is_a? Integer))
            i = i - 1
            if($fruits[i] == nil)
                puts "Fruit for this index not found, please try again."
                delete
            end
        else
            puts "Index should be numeric, please try again."
            delete
        end

        $fruits.delete_at(i)

        puts $br
        list
    end

    def search
        puts $br
        puts "Please enter name or color or price of fruit to search :"
        keyword = gets.chomp
        
        if(keyword == "" || keyword == nil)
            puts "Please enter some valid keywords to search"
            search
        end

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

fr = Fruit.new
fr.list