class StudentsPresenter
  def initialize(students)
    @students = students.map { |s| StudentPresenter.new(s) }
  end

  def order_by(order)
    case order
    when :campus_and_first_name
      @students.sort_by { |student| [student.campus, student.first_name] }

    when :date_of_birth_descending
      @students.sort_by(&:date_of_birth).reverse

    else
      raise ArgumentError, "Unknown order #{order.inspect}"
    end
  end
end
