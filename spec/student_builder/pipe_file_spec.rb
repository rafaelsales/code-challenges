require "spec_helper"

describe StudentBuilders::PipeFile do
  describe "#students" do
    let(:builder) { StudentBuilders::PipeFile.new("./fixtures/pipe.txt") }

    it "returns Student objects with file data" do
      students = builder.students

      students.count.must_equal 3
      students[0].must_equal Student.new(first_name: "Timmothy", last_name: "Goyette", middle_initial: "E",
                                         campus: "London", favorite_color: "Pacific Blue",
                                         date_of_birth: Date.new(1964, 10, 2))
    end
  end
end
