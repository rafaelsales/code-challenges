require 'rails_helper'

RSpec.describe 'Movie Rating' do
  let!(:user) { User.create!(email: 'admin@favmovie.com', password: 'qwerty', role: :user) }
  let(:goonies) { Movie.create!(title: 'The Goonies', year: 1985) }

  before do
    Given 'there is a movie in database' do
      goonies.touch
    end
  end

  describe 'create' do
    context 'with a valid payload' do
      it 'rates a movie' do
        When 'POST /movies/:movie_id/rating' do
          post "/movies/#{goonies.id}/rating", { stars: 4 }, http_auth_header(user)
        end

        Then 'creates the rating' do
          expect(response).to be_created

          rating = goonies.ratings.first
          expect(rating.stars).to eq 4.to_d
          expect(rating.user).to eq user
        end
      end
    end

    context 'with an invalid payload' do
      it 'rates a movie' do
        When 'POST /movies/:movie_id/rating' do
          post "/movies/#{goonies.id}/rating", {}, http_auth_header(user)
        end

        Then 'does not create the rating and return errors' do
          expect(response.status).to eq 422
          expect(json_response['errors']['stars']).to include("can't be blank")
        end
      end
    end
  end

  describe 'destroy' do
    it 'removes a user rating' do
      Given 'the movie already have a rating' do
        goonies.rate(user: user, stars: 1)
        expect(goonies.ratings.count).to eq 1
      end

      When 'POST /movies/:movie_id/rating' do
        delete "/movies/#{goonies.id}/rating", {}, http_auth_header(user)
      end

      Then 'removes the rating' do
        expect(response.status).to eq 204
        expect(goonies.ratings.count).to eq 0
      end
    end
  end
end
