# Retrieves the next two available dates skipping holidays and weekends
#
# Usage:
#   Calling `PickupService.available_dates("2pm")` will return a structure such as:
#   [
#     { date: Mon, 15 Sep 2014, description: "Today" },
#     { date: Tue, 16 Sep 2014, description: "Tomorrow" }
#   ]
class PickupService
  def self.available_dates(cutoff_hour)
    new(cutoff_hour).available_dates
  end

  attr_reader :cutoff_hour

  def initialize(cutoff_hour)
    @cutoff_hour = parse_cutoff_hour(cutoff_hour)
  end

  def available_dates
    first = first_availaible_date
    second = second_available_date(first)

    [
      { date: first.date, description: first.friendly_weekday },
      { date: second.date, description: second.friendly_weekday }
    ]
  end

  private

  def first_availaible_date
    today = Calendar.new(Date.today)
    can_deliver_today? ? today : today.next_working_day
  end

  def second_available_date(first)
    first.clone.next_working_day
  end

  def can_deliver_today?
    Calendar.new(Date.today).working_day? && Time.now.hour < cutoff_hour
  end

  def parse_cutoff_hour(hour_string)
    time = (Time.strptime(hour_string, "%l%P") rescue nil)
    time = (Time.strptime(hour_string, "%H:00:00") rescue nil) if time.nil?
    time = (Time.strptime(hour_string, "%H:00") rescue nil) if time.nil?
    time.nil? ? raise("Invalid cut-off time") : time.hour
  end
end
