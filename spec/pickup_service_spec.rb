require "spec_helper"

describe PickupService do
  describe "#available_dates" do
    it "returns next two available working days when current time is before cut-off time" do
      # Current time will be: Monday, September 15, 2014 at 11am
      Timecop.freeze Time.local(2014, 9, 15, 11, 0) do
        PickupService.available_dates("2pm").must_equal [
          { date: Date.new(2014, 9, 15), description: "Today" },
          { date: Date.new(2014, 9, 16), description: "Tomorrow" }
        ]
      end
    end

    it "returns next two available working days when current time if after cut-off time" do
      # Current time will be: Monday, September 15, 2014 at 3pm
      Timecop.freeze Time.local(2014, 9, 15, 15, 0) do
        PickupService.available_dates("2pm").must_equal [
          { date: Date.new(2014, 9, 16), description: "Tomorrow" },
          { date: Date.new(2014, 9, 17), description: "Wednesday" }
        ]
      end
    end

    it "returns available days when there's a holiday and current time is exactly the cut-off time" do
      # Current time will be: Friday, August 22, 2014 at 4pm
      # Note that August 25th is a Bank Holiday in England
      Timecop.freeze Time.local(2014, 8, 22, 16, 0) do
        PickupService.available_dates("4pm").must_equal [
          { date: Date.new(2014, 8, 26), description: "Tuesday" },
          { date: Date.new(2014, 8, 27), description: "Wednesday" }
        ]
      end
    end

    describe "cut-off date string patterns" do
      it "accepts 10am and 14pm format" do
        Timecop.freeze Time.local(2014, 9, 15, 0, 0) do
          PickupService.available_dates("10am").first[:date].must_equal Date.new(2014, 9, 15)
        end

        Timecop.freeze Time.local(2014, 9, 15, 9, 0) do
          PickupService.available_dates("4pm").first[:date].must_equal Date.new(2014, 9, 15)
        end
      end

      it "accepts 10:00:00 and 14:00:00 format" do
        Timecop.freeze Time.local(2014, 9, 15, 9, 0) do
          PickupService.available_dates("10:00:00").first[:date].must_equal Date.new(2014, 9, 15)
        end

        Timecop.freeze Time.local(2014, 9, 15, 9, 0) do
          PickupService.available_dates("14:00:00").first[:date].must_equal Date.new(2014, 9, 15)
        end
      end

      it "accepts 10:00 and 14:00 format" do
        Timecop.freeze Time.local(2014, 9, 15, 9, 0) do
          PickupService.available_dates("10:00").first[:date].must_equal Date.new(2014, 9, 15)
        end

        Timecop.freeze Time.local(2014, 9, 15, 9, 0) do
          PickupService.available_dates("14:00").first[:date].must_equal Date.new(2014, 9, 15)
        end
      end
    end
  end
end
