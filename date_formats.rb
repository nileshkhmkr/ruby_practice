require 'date'
class DateFormats

    # valid date formats
    $valid_formats = {
        "IST"           => "%d/%m/%Y",                  # "29/09/2021"
        "PST"           => "%m/%d/%Y",                  # "09/29/2021"
        "ORT"           => "%Y-%m-%d %H:%M:%S %z",      # "2012-10-02 11:51:04 -0700"
        "Month d, Y"    => "%B %-d, %Y",                # "October 2, 2012"
        "Month d, Y Z"  => "%B %-d, %Y %Z",             # "October 2, 2012 PDT"
        "Ymd"           => "%Y%m%d",                    # "20121002"
        "YmdHMS"        => "%Y%m%d%H%M%S",              # "20121002115124"
        "dmY"           => "%d/%m/%Y",                  # "29/09/2021"
        "dmy"           => "%d/%m/%y",                  # "29/09/21"
        "mdY"           => "%m/%d/%Y",                  # "10/02/2012"
        "mdy"           => "%m/%d/%y",                  # "10/02/12"
        "Y-m-d HMS z"   => "%Y-%m-%d %H:%M:%S %z",      # "2012-10-02 11:51:04 -0700"
        "Y-m-d HMS Z"   => "%Y-%m-%d %H:%M:%S %Z",      # "2012-10-02 11:51:04 PDT"
        "Ymd IMS p"     => "%Y/%m/%d %I:%M:%S %p",      # "2012/10/02 10:18:34 PM"
        "mdY I p"       => "%m/%d/%Y %I %p",            # "10/02/2012 10 PM"
    }

    # logic to convert into new format
    def change_format(input_date, new_format)
        format_string = $valid_formats[new_format]

        # date stamp
        date_stamp = Date.parse(input_date)

        # convert into new format
        output_date = date_stamp.strftime(format_string)
        return output_date
    end

    # get inputs from user
    def get_inputs
        # get valid inputs
        input_date = get_valid_date
        new_format = get_valid_format

        # change format
        output_date = change_format(input_date, new_format)

        # print output
        puts "Newly formated date  : #{output_date}"
    end

    # get valid date input
    def get_valid_date
        puts 'Please enter the date : '
        input_date = gets.chomp

        # validate date in exception handling way
        begin
            Date.parse(input_date)
            return input_date
        rescue ArgumentError
            # handle invalid date
            puts "Entered date is not parsable! please try again."
            get_valid_date
        end
    end

    # get valid date format
    def get_valid_format
        puts "Please enter the format : "
        new_format = gets.chomp

        # validate format
        if($valid_formats[new_format] == nil)
            puts "Unable to detect this format, Converting to default format - PST"
            new_format = "PST"
        end
        return new_format
    end
end

# class instance
df = DateFormats.new()
df.get_inputs
