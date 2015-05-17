require "timecop"
require_relative "app"

def print_dates(available_dates)
  available_dates.each do |entry|
    entry[:date] = entry[:date].strftime("%a, %b %e %Y")
  end
  puts available_dates
end

puts "\n1) Assuming it is Monday the 15th of September at 11am:"
Timecop.freeze Time.local(2014, 9, 15, 11, 0) do
  print_dates PickupService.available_dates("2pm")
end

puts "\n2) Assuming it is Monday the 15th of September at 3pm:"
Timecop.freeze Time.local(2014, 9, 15, 15, 0) do
  print_dates PickupService.available_dates("2pm")
end

puts "\n3) Assuming it is Friday, the 22nd of August at 4pm (and the 25th is a Bank Holiday in England):"
Timecop.freeze Time.local(2014, 8, 22, 16, 0) do
  print_dates PickupService.available_dates("4pm")
end
