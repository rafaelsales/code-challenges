require "spec_helper"

describe StudentBuilders::CommaFile do
  describe "#students" do
    let(:builder) { StudentBuilders::CommaFile.new("./fixtures/comma.txt") }

    it "returns Student objects with file data" do
      students = builder.students

      students.count.must_equal 3
      students[0].must_equal Student.new(first_name: "Mckayla",
                                         campus: "Atlanta",
                                         date_of_birth: Date.new(1986, 5, 29))
    end
  end
end
