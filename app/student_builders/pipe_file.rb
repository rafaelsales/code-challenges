require "csv"

module StudentBuilders
  class PipeFile
    SEPARATOR = " | "

    def initialize(file_path)
      @file = CSV.open(file_path, col_sep: SEPARATOR)
    end

    def students
      @file.read.map do |date_of_birth, first_name, campus|
        Student.new(first_name: first_name,
                    campus: campus,
                    date_of_birth: parse_date(date_of_birth))
      end
    end

    private

    def parse_date(date_string)
      Date.strptime(date_string, "%m-%d-%Y")
    end
  end
end
