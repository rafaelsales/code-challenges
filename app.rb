Dir.glob("app/**/*.rb").each { |file| require_relative file }

class StudentsApp
  def initialize(comma_file:, dollar_file:, pipe_file:)
    @student_builders = [
      StudentBuilders::CommaFile.new(comma_file),
      StudentBuilders::DollarFile.new(dollar_file),
      StudentBuilders::PipeFile.new(pipe_file),
    ]
  end

  def run!
    puts "\nOutput 1:"
    print students_presenter.order_by(:campus_and_first_name)

    puts "\nOutput 2:"
    print students_presenter.order_by(:date_of_birth_descending)
  end

  private

  def print(students)
    students.each { |student| puts student.to_s }
  end

  def students_presenter
    @students_presenter ||= begin
      all_students = @student_builders.map(&:students).flatten
      StudentsPresenter.new(all_students)
    end
  end
end
