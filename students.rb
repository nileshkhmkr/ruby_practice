class Student
    # adding some members in the class as instance variables
    @roll_no            = 0
    @name               = ""
    @marks1             = 0
    @marks2             = 0
    @marks3             = 0
    @total_marks        = 100
    @average_marks      = 0

    # adding a global variable
    $number_of_subjects = 3

    # constructor method
    def initialize(roll_no, name, marks1, marks2, marks3)
        # we can add whatever constuct logic here that we want

        # for now we are passing construct data to set_student_details method
        # so that by again calling set_student_details we can also update values of an instance
        set_student_details(roll_no, name, marks1, marks2, marks3)
    end

    # set student details in member properties
    def set_student_details(roll_no, name, marks1, marks2, marks3)
        # values from input
        @roll_no        = roll_no
        @name           = name
        @marks1         = marks1
        @marks2         = marks2
        @marks3         = marks3

        # dynamically changing values
        @total_marks    = calculate_total
        @average_marks  = calculate_average
    end

    # writing some methods by which we can directly return values of members
    def roll_no
        @roll_no
    end

    def name
        @name
    end

    def marks1
        @marks1
    end

    def marks2
        @marks2
    end

    def marks3
        @marks3
    end

    #function to print student details
    def display_student_details
        puts "Roll no. : #{@roll_no}"
        puts "Student Name : #{@name}"
        puts "Total Marks : #{@total_marks}"
        puts "Average Marks : #{@average_marks}"
    end

    #function to calculate total marks of student
    def calculate_total
        @marks1 + @marks2 + @marks3
    end

    #function to calculate average marks of student
    def calculate_average
        @total_marks.div($number_of_subjects)
    end
end

# subclass to practice inheritance
class StudentDemo < Student
    # we can add new methods here
    # or we can also override any parent class method here, if we want
end

# create instance of Student class
s1 = StudentDemo.new(1,"Nilesh",70,80,90)

# check student details
s1.display_student_details

# we can update values if we want by this
# s1.set_student_details(1,"Nilesh Khamkar",70,75,80)

# we can also check any specific member value like this
# puts s1.name
