require "spec_helper"

describe StudentBuilders::DollarFile do
  describe "#students" do
    let(:builder) { StudentBuilders::DollarFile.new("./fixtures/dollar.txt") }

    it "returns Student objects with file data" do
      students = builder.students

      students.count.must_equal 3
      students[0].must_equal Student.new(first_name: "Rhiannon", last_name: "Nolan", middle_initial: "O",
                                         campus: "Los Angeles", favorite_color: "Vivid Tangerine",
                                         date_of_birth: Date.new(1974, 10, 04))
    end

    it "converts each known city abbreviation to city name" do
      students = builder.students

      students[0].campus.must_equal "Los Angeles"
      students[1].campus.must_equal "New York City"
      students[2].campus.must_equal "San Francisco"
    end

    describe "when file contains unknown campus abbreviation" do
      let(:file) { Tempfile.new("dollar.txt") }
      let(:builder) { StudentBuilders::DollarFile.new(file.path) }

      before do
        file.write "Sales $ Rafael $ C $ CE $ 7-6-1986 $ "
        file.rewind
      end

      it "raises error when campus abbreviation is not known" do
        error = assert_raises(RuntimeError) do
          builder.students.must_raise
        end

        error.message.must_equal 'Unknown campus name for abbreviation "CE"'
      end
    end
  end
end
