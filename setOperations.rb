class SetOperations

    # adding some members in the class as instance variables
    @set_a
    @set_b
    @set_c
    @universal

    # constructor method
    def initialize(set_a, set_b, set_c)
        # values from input
        @set_a = set_a
        @set_b = set_b
        @set_c = set_c
        @universal = universal(@set_a, @set_b, @set_c).sort
    end

    # method to calculate intersection
    def intersection(a, b)
        a & b
    end

    # method to calculate union
    def union(a, b)
        a | b
    end

    # method to calculate universal set
    def universal(a, b, c)
        a | b | c
    end

    # method to calculate set compliment (Universal - Subset)
    def compliment_of(u, s)
        u - s
    end

    # method to calculate cartesian product
    def cartesian_product(a, b)
        cartesian = []
        a.each do |i|
            b.each do |j|
                cartesian.push([i,j])
            end
        end
        return cartesian
    end

    # method to calculate commutative law
    def commutative_law(a, b)
        a_inter_b = intersection(a, b).sort
        b_inter_a = intersection(b, a).sort
        puts "A Inter B = #{a_inter_b}  and  B Inter A = #{b_inter_a}"

        a_uni_b = union(a, b).sort
        b_uni_a = union(b, a).sort
        puts "A Union B = #{a_uni_b}  and  B Union A = #{b_uni_a}"

        if(a_inter_b == b_inter_a && a_uni_b == b_uni_a)
            return true
        else
            return false
        end
    end

    # method to calculate associative law
    def associative_law(a, b, c)
        a_inter_b = intersection(a, b).sort
        b_inter_c = intersection(b, c).sort
        ab_inter_c = intersection(a_inter_b, c).sort
        a_inter_bc = intersection(a, b_inter_c).sort
        puts "(A^B)^C = #{ab_inter_c}  and  A^(B^C) = #{a_inter_bc}"

        a_uni_b = union(a, b).sort
        b_uni_c = union(b, c).sort
        ab_uni_c = union(a_uni_b, c).sort
        a_uni_bc = union(a, b_uni_c).sort
        puts "(AUB)UC = #{ab_uni_c}  and  AU(BUC) = #{a_uni_bc}"

        if(a_inter_bc == ab_inter_c && a_uni_bc == ab_uni_c)
            return true
        else
            return false
        end
    end

    # method to calculate de Morgan's law
    def de_morgans_law(a, b)
        a_compli = compliment_of(@universal, a)
        b_compli = compliment_of(@universal, b)

        a_inter_b = intersection(a, b).sort
        compli_of_a_inter_b = compliment_of(@universal, a_inter_b)
        a_compli_uni_b_compli = union(a_compli, b_compli).sort
        puts "(A^B)' = #{compli_of_a_inter_b}  and  A' U B' = #{a_compli_uni_b_compli}"

        a_uni_b = union(a, b).sort
        compli_of_a_uni_b = compliment_of(@universal, a_uni_b)
        a_compli_inter_b_compli = intersection(a_compli, b_compli).sort
        puts "(AUB)' = #{compli_of_a_uni_b}  and  A'^ B' = #{a_compli_inter_b_compli}"

        if(compli_of_a_inter_b == a_compli_uni_b_compli && compli_of_a_uni_b == a_compli_inter_b_compli)
            return true
        else
            return false
        end
    end

    # calculate set operations
    def calculate_all
        puts "Set A is : #{@set_a}"
        puts "Set B is : #{@set_b}"
        puts "Set C is : #{@set_c}"
        puts "\n"

        inter = intersection(@set_a, @set_b).sort
        puts "Intersection of A and B (A^B): #{inter}"
        puts "\n"

        uni = union(@set_a, @set_b).sort
        puts "Union of A and B (AUB): #{uni}"
        puts "\n"

        a_compli = compliment_of(@universal, @set_a)
        puts "A Compliment (A') : #{a_compli}"
        puts "\n"

        carte = cartesian_product(@set_a, @set_b)
        puts "Cartesian Product (AxB): #{carte}"
        puts "\n"

        puts "Cummulative law : "
        cummul = commutative_law(@set_a, @set_b)
        if(cummul == true)
            puts "This law states that the Intersection / Union of two sets is the same no matter what the order is in the equation."
            puts "i.e A^B = B^A  and  AUB = BUA"
        else
            puts "Unable to prove Cummulative law."
        end
        puts "\n"

        puts "Associative law : "
        assoc = associative_law(@set_a, @set_b, @set_c)
        if(assoc == true)
            puts "Hence this law is proved."
            puts "i.e  (A^B)^C = A^(B^C)  and  (AUB)UC = AU(BUC)"
        else
            puts "Unable to prove Associative law."
        end
        puts "\n"

        puts "De Morgan's law : "
        de_morg = de_morgans_law(@set_a, @set_b)
        if(de_morg == true)
            puts "Hence this law is proved."
            puts "i.e (A^B)' = A' U B'  and  (AUB)' = A' ^ B'"
        else
            puts "Unable to prove De Morgan's law."
        end
        puts "\n"
    end
end

# create instance of class
s_op = SetOperations.new([1,2,3,4], [1,2,3,5,6,], [1,2,7,8])

#call calculation method to display results
s_op.calculate_all
