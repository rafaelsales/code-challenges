require "csv"

module StudentBuilders
  class DollarFile
    SEPARATOR = " $ "
    CAMPUSES_NAMES = {
      "LA"  => "Los Angeles",
      "NYC" => "New York City",
      "SF"  => "San Francisco",
    }

    def initialize(file_path)
      @file = CSV.open(file_path, col_sep: SEPARATOR)
    end

    def students
      @file.read.map do |campus, date_of_birth, last_name, first_name|
        Student.new(first_name: first_name,
                    last_name: last_name,
                    campus: resolve_campus_name(campus),
                    date_of_birth: parse_date(date_of_birth))
      end
    end

    private

    def parse_date(date_string)
      Date.strptime(date_string, "%m-%d-%Y")
    end

    def resolve_campus_name(abbreviation)
      CAMPUSES_NAMES[abbreviation] or raise "Unknown campus name for abbreviation #{abbreviation.inspect}"
    end
  end
end
