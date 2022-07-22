class NumberToWords

    # hash of number to words
    $n_to_w = {
        10000000=> "Crore",
        100000  => "lakh",
        1000    => "thousand",
        100     => "hundred",
        90      => "ninety",
        80      => "eighty",
        70      => "seventy",
        60      => "sixty",
        50      => "fifty",
        40      => "forty",
        30      => "thirty",
        20      => "twenty",
        19      =>"nineteen",
        18      =>"eighteen",
        17      =>"seventeen", 
        16      =>"sixteen",
        15      =>"fifteen",
        14      =>"fourteen",
        13      =>"thirteen",              
        12      =>"twelve",
        11      => "eleven",
        10      => "ten",
        9       => "nine",
        8       => "eight",
        7       => "seven",
        6       => "six",
        5       => "five",
        4       => "four",
        3       => "three",
        2       => "two",
        1       => "one"
    }

    # array of input integers
    $nums = []

    # array of output words
    $words = []

    # method to read lines from file
    def read_file(filename)
        $nums = File.readlines(filename)
    end

    # method to write lines to file
    def write_file(filename)
        File.open(filename, "w+") do |i|
            i.puts($words)
        end
    end

    # method to convert integers to words
    def number_to_word(int)
        #conversion logic
        if($n_to_w.key?(int))
            return $n_to_w[int]
        else
            $n_to_w.each do |num, word|
                if(int.to_s.length == 1 && int/num > 0)
                    return word      
                elsif(int < 100 && int/num > 0)
                    if(int%num == 0)
                        return word
                    else
                        return word + " " + number_to_word(int%num)
                    end
                elsif(int/num > 0)
                    return number_to_word(int/num) + " #{word} " + number_to_word(int%num)
                end
            end
        end
    end

    # function to call the logic
    def convert(read_file, write_file)
        # gather numeric values from file
        read_file(read_file)

        # conversion
        $nums.each do |int|
            i = int.chomp.to_i
            if(i != "" && i != 0 && (i.is_a? Integer))
                # call to logic
                word = number_to_word(i).capitalize()

                # prepare output
                output = "#{i} : #{word}"
                puts output

                # add to nums array
                $words.push(output)
            end
        end

        # write words to file
        write_file(write_file)
    end
end

# class instance
ntw = NumberToWords.new
ntw.convert("numbers.txt","words.txt")