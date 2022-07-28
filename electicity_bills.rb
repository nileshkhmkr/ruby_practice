class ElecticityBills

    $inputs = []
    $bills = []
    
    # some reusable variables
    $br     = "\n"
    $thr    = "________________________________________________"
    $head   = "Sr.| Consumer Name | Units Consumed  | Bill Amt "
    $tr     = "------------------------------------------------"

    #collect inputs from user and store
    def get_inputs
        # count of consumers
        count = get_valid_count

        # loop for getting consumer details
        for i in 1..count do
            puts "Please enter Consumer #{i} name :"
            name = gets.chomp

            puts "Please enter number of units consumed"
            units = gets.chomp.to_i

            # store inputs
            $inputs.push({"name" => name, "units" => units})
            i = i + 1
        end

        # generate bills for all the consumers
        generate_bills

        # display generated bills
        show_bills
    end

    # get valid count of consumers
    def get_valid_count
        puts "Please enter the number of consumers :"
        count = gets.chomp
        c = count.to_i

        if (c != 0 && (c.is_a? Integer))
            return c
        else
            puts "Sorry you entered '#{count}'! please enter a valid number :"
            puts $br
            get_valid_count
        end
    end

    # method to generate and store bills
    def generate_bills
        # iterating through $inputs array of hashes
        $inputs.each do |data|
            # calculate bill
            bill = calculate_bill(data["units"])
            # convert bill amount in float
            bill = bill.to_f

            #store the bill in all bills
            bill_details = {"name" => data["name"], "units" => data["units"], "bill" => bill}
            $bills.push(bill_details)
        end
    end

    # method to calculate a bill
    def calculate_bill(units)
        bill = 0

        # billing rules
        if(units <= 100)
            bill = units*6
        elsif(units > 100 && units <= 300)
            over_units = units - 100
            bill = 100*6 + over_units*11
        else
            over_units = units - 300 
            bill = 100*6 + 200*11 + over_units*15
        end

        # additional surcharge
        if(bill <= 300)
            bill = bill + (bill*5)/100
        else
            bill = bill + (bill*15)/100
        end

        # minimum bill charged is 50 rs
        if(bill < 50)
            bill = 50
        end

        return bill
    end

    # method to display all bills
    def show_bills
        puts $br
        puts "Bills for this month :"
        puts $thr
        puts $head
        puts $thr

        # iterating through $bills array of hashes
        $bills.each_with_index do |bill, i|
            puts " #{i + 1} | #{bill["name"]}    | #{bill["units"]}   | #{bill["bill"]}"
            puts $tr
        end
    end
end

# class instance
eb = ElecticityBills.new()
eb.get_inputs