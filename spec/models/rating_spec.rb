require 'rails_helper'

RSpec.describe Rating do
  describe 'associations' do
    it { is_expected.to belong_to(:movie) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:stars) }
    it { is_expected.to validate_inclusion_of(:stars).in_range(1..5) }
  end
end
