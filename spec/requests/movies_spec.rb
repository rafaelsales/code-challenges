require 'rails_helper'

RSpec.describe 'Movies' do
  let!(:user) { User.create!(email: 'admin@favmovie.com', password: 'qwerty', role: :admin) }
  let(:goonies) { Movie.create!(title: 'The Goonies', year: 1985) }
  let(:super_eight) do
    Movie.create!(title: 'Super 8', year: 2011).tap do |movie|
      movie.rate(user: user, stars: 4)
    end
  end

  describe 'index' do
    it 'lists all movies' do
      Given 'there are several movies in database' do
        super_eight.touch
        goonies.touch
      end

      When 'GET /movies' do
        get '/movies'
      end

      Then 'returns all movies' do
        expect(json_response.first).to include({ title: 'Super 8', average_rating: '4.0' }.stringify_keys)
        expect(json_response.last).to include({ title: 'The Goonies', year: 1985, average_rating: nil }.stringify_keys)
      end

      And 'json satisfies expected schema' do
        expect(json_response.first).to match_json_schema('movie')
      end
    end
  end
end
