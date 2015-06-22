require 'rails_helper'

RSpec.describe Movie do
  describe 'associations' do
    it { is_expected.to have_many(:ratings) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:year) }
  end

  describe '#average_rating' do
    let(:goonies) { Movie.create!(title: 'The Goonies', year: 1985) }

    context 'when there is at least one rating' do
      before { goonies.ratings.create([{ stars: 3 }, { stars: 5 }]) }

      it 'returns the average of users ratings' do
        expect(goonies.average_rating).to eq 4.to_d
      end
    end

    context 'when movie does not have ratings' do
      it 'returns the average of users ratings' do
        expect(goonies.average_rating).to be_nil
      end
    end
  end
end
