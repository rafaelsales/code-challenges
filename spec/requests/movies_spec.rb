require 'rails_helper'

RSpec.describe 'Movies' do
  let(:goonies) { Movie.create!(title: 'The Goonies', year: 1985) }
  let(:super_eight) { Movie.create!(title: 'Super 8', year: 2011) }

  describe 'index' do
    it 'lists all movies' do
      Given 'there are several movies in database' do
        goonies.touch
        super_eight.touch
      end

      When 'requesting index path' do
        get '/movies'
      end

      Then 'returns all movies' do
        titles = json_response.map { |movie| movie['title'] }
        expect(titles).to match_array ['The Goonies', 'Super 8']
      end

      And 'json satisfies expected schema' do
        expect(json_response.first).to match_json_schema('movie')
      end
    end
  end
end
