require "forwardable"

class StudentPresenter < Struct.new(:student)
  extend Forwardable

  def_delegators :student, :first_name, :last_name, :campus, :favorite_color, :date_of_birth

  def formatted_date_of_birth
    date_of_birth.strftime("%-m/%-d/%Y")
  end

  def to_s
    "#{first_name} #{campus} #{formatted_date_of_birth}"
  end
end
