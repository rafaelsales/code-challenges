require "spec_helper"

describe Calendar do
  describe "#next_working_day" do
    it "returns next day when following day is a working day" do
      calendar = Calendar.new(Date.new(2015, 1, 5)) # Monday
      calendar.next_working_day.date.must_equal Date.new(2015, 1, 6) #Tuesday
    end

    it "returns Monday when it's Friday" do
      calendar = Calendar.new(Date.new(2015, 1, 2)) # Friday
      calendar.next_working_day.date.must_equal Date.new(2015, 1, 5) # Monday
    end

    it "returns Tueday when it's Friday and next Monday is a holiday" do
      calendar = Calendar.new(Date.new(2015, 5, 1)) # Friday
      calendar.next_working_day.date.must_equal Date.new(2015, 5, 5) # Tuesday
    end

    it "returns Monday when it's Wednesday and following Thursday and Friday are holidays" do
      calendar = Calendar.new(Date.new(2014, 12, 24)) # Wednesday
      calendar.next_working_day.date.must_equal Date.new(2014, 12, 29) # Monday
    end
  end

  describe "#friendly_weekday" do
    it "returns 'Today' when date is today" do
      Calendar.new(Date.today).friendly_weekday.must_equal "Today"
    end

    it "returns 'Tomorrow' when date is tomorrow" do
      Calendar.new(Date.today.next).friendly_weekday.must_equal "Tomorrow"
    end

    it "returns 'Monday' when date refers to Monday" do
      Calendar.new(Date.new(2015, 5, 11)).friendly_weekday.must_equal "Monday"
    end
  end

  describe "#working_day?" do
    it "returns true when it's a working day" do
      assert Calendar.new(Date.new(2015, 5, 18)).working_day?
    end

    it "returns false when it's Sunday" do
      refute Calendar.new(Date.new(2015, 5, 17)).working_day?
    end

    it "returns false when it's Saturday" do
      refute Calendar.new(Date.new(2015, 5, 16)).working_day?
    end

    it "returns false when it's a holiday" do
      refute Calendar.new(Date.new(2015, 12, 25)).working_day?
    end
  end
end
