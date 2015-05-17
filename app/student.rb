class Student < Struct.new(:first_name, :last_name, :middle_initial, :campus, :favorite_color, :date_of_birth)

  def initialize(**args)
    args.each { |attribute, value| self[attribute] = value }
  end
end
