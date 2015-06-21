require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:year) }
  end
end
