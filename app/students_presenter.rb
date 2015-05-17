class StudentsPresenter
  def initialize(students)
    @students = students.map { |s| StudentPresenter.new(s) }
  end

  def order_by(order)
    case order
    when :campus_and_last_name
      @students.sort_by { |student| [student.campus, student.last_name] }

    when :date_of_birth
      @students.sort_by(&:date_of_birth)

    when :last_name_descending
      @students.sort_by(&:last_name).reverse

    else
      raise ArgumentError, "Unknown order #{order.inspect}"
    end
  end
end
