require "yaml"

class Calendar
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def next_working_day
    loop do
      @date = date.next
      break if working_day?
    end
    self
  end

  def friendly_weekday
    case date.to_date
    when Date.today then "Today"
    when Date.today.next then "Tomorrow"
    else date.strftime("%A")
    end
  end

  def working_day?
    !date.saturday? && !date.sunday? && !holiday?
  end

  def holiday?
    Calendar.holidays_for_year(date.year).any? { |holiday| holiday == date }
  end

  def clone
    Calendar.new(date)
  end

  class << self
    def holidays_for_year(year)
      holidays_database[year].keys.map { |date_str| Date.parse(date_str) }
    end

    def holidays_database
      @holidays_database ||= YAML.load(File.new("uk_bank_holidays.yml"))
    end
  end
end
