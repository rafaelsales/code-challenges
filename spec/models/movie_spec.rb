require 'rails_helper'

RSpec.describe Movie do
  let(:goonies) { Movie.create!(title: 'The Goonies', year: 1985) }
  let!(:user) { User.create!(email: 'rafael@favmovie.com', password: 'qwerty', role: :user) }

  describe 'associations' do
    it { is_expected.to have_many(:ratings) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:year) }
  end

  describe '#average_rating' do
    context 'when there is at least one rating' do
      let!(:another_user) { User.create!(email: 'franze@favmovie.com', password: 'qwerty', role: :user) }

      before do
        goonies.rate(user: user, stars: 3)
        goonies.rate(user: another_user, stars: 5)
      end

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

  describe 'rating' do
    describe '#rate' do
      it 'creates and updates a rating' do
        expect { goonies.rate(user: user, stars: 3) }.to change { goonies.ratings.count }.by(1)
        expect(goonies.ratings.first.stars).to eq 3

        expect { goonies.rate(user: user, stars: 4) }.to change { goonies.ratings.count }.by(0)
        expect(goonies.ratings.first.stars).to eq 4
      end
    end

    describe '#unrate' do
      it 'destroys a rating' do
        goonies.rate(user: user, stars: 3)
        expect { goonies.unrate(user) }.to change { goonies.ratings.count }.by(-1)
        expect { goonies.unrate(user) }.to change { goonies.ratings.count }.by(0)
      end
    end
  end
end
