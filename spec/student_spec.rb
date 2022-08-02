require_relative '../student'

describe Student do
  describe "total marks" do 
    it "Should return average marks of all subjects" do 
      expect(StudentDemo.new(1,"Nilesh",70,80,90).calculate_total).to eq(240)
    end
  end

  describe "average marks" do 
    it "Should return average marks of all subjects" do 
      expect(StudentDemo.new(1,"Nilesh",70,80,90).calculate_average).to eq(80)
    end
  end
end