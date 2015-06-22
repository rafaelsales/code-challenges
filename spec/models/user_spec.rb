require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:ratings) }
  end

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_inclusion_of(:role).in_array(User::ROLES) }
end
