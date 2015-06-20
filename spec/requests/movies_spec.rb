require 'rails_helper'

RSpec.describe 'Movies' do
  let(:super_eight) do
    Movie.create!(title: 'Super 8', year: 2011).tap do |movie|
      movie.ratings.create([{ stars: 3 }, { stars: 5 }])
    end
  end
  let(:goonies) do
    Movie.create!(title: 'The Goonies', year: 1985).tap do |movie|
      movie.ratings.create([{ stars: 4 }, { stars: 3 }])
    end
  end

  describe 'index' do
    it 'lists all movies' do
      Given 'there are several movies in database' do
        goonies.touch
        super_eight.touch
      end

      When 'GET /movies' do
        get '/movies'
      end

      Then 'returns all movies' do
        expect(json_response.first).to include({ title: 'The Goonies', year: 1985, average_rating: '3.5' }.stringify_keys)
        expect(json_response.last).to include({ title: 'Super 8', average_rating: '4.0' }.stringify_keys)
      end

      And 'json satisfies expected schema' do
        expect(json_response.first).to match_json_schema('movie')
      end
    end
  end
end
