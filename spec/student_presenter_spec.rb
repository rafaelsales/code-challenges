require "spec_helper"

describe StudentPresenter do
  let(:student) do
    Student.new(first_name: "Rafael", last_name: "Sales",
                campus: "Fortaleza", favorite_color: "Blue",
                date_of_birth: Date.new(1986, 7, 6))
  end
  let(:presenter) { StudentPresenter.new(student) }

  describe "delegation to student object" do
    [:first_name, :last_name, :campus, :favorite_color, :date_of_birth].each do |attribute|
      it "delegates #{attribute} to student object" do
        student.public_send(attribute).must_equal presenter.public_send(attribute)
      end
    end
  end

  describe "#formatted_date_of_birth" do
    it "returns formatted date in format m/d/yyyy" do
      "7/6/1986".must_equal presenter.formatted_date_of_birth
    end
  end
end
