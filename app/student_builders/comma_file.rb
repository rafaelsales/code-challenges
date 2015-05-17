require "csv"

module StudentBuilders
  class CommaFile
    SEPARATOR = ", "

    def initialize(file_path)
      @file = CSV.open(file_path, col_sep: SEPARATOR)
    end

    def students
      @file.read.map do |last_name, first_name, campus, favorite_color, date_of_birth|
        Student.new(first_name: first_name,
                    last_name: last_name,
                    campus: campus,
                    date_of_birth: parse_date(date_of_birth),
                    favorite_color: favorite_color)
      end
    end

    private

    def parse_date(date_string)
      Date.strptime(date_string, "%m/%d/%Y")
    end
  end
end
