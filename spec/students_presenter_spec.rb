require "spec_helper"

describe StudentsPresenter do
  let(:kent)  { Student.new(last_name: "Beck",  campus: "UO", date_of_birth: Date.new(1961, 1, 1)) }
  let(:steve) { Student.new(last_name: "Jobs",  campus: "SF", date_of_birth: Date.new(1955, 2, 24)) }
  let(:rigo)  { Student.new(last_name: "Bruen", campus: "SF", date_of_birth: Date.new(1962, 12, 1)) }

  let(:presenter) { StudentsPresenter.new([steve, kent, rigo]) }

  describe "#order_by" do
    it "orders by campus and last_name" do
      expected_order = wrap_in_presenters [rigo, steve, kent]
      expected_order.must_equal presenter.order_by(:campus_and_last_name)
    end

    it "orders by date_of_birth" do
      expected_order = wrap_in_presenters [steve, kent, rigo]
      expected_order.must_equal presenter.order_by(:date_of_birth)
    end

    it "orders by last_name_descending" do
      expected_order = wrap_in_presenters [steve, rigo, kent]
      expected_order.must_equal presenter.order_by(:last_name_descending)
    end

    it "raises error when order is unknown" do
      error = assert_raises(ArgumentError) do
        presenter.order_by(:wooot)
      end

      error.message.must_equal "Unknown order :wooot"
    end
  end

  def wrap_in_presenters(students)
    students.map { |s| StudentPresenter.new(s) }
  end
end
