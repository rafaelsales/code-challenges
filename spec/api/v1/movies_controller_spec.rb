require 'spec_helper'

describe API::V1::MoviesController, type: :api do

  describe "create" do
    let!(:path) { "/api/v1/movies" }

    it "responds with good status on successful creation" do
      expect {
        post path, movie: { title: "Private Resort", year: 1985, genres: ["Commedy"] }
      }.to change { Movie.count }.by(1)

      expect(last_response.status).to eq 201
      expect(last_response.header["Location"]).to eq "/api/v1/movies/#{Movie.last.id}"
    end

    it "responds with bad status on failure" do
      expect {
        post path, movie: { year: 1990  }
      }.to_not change { Movie.count }

      expect(last_response.status).to eq 422
      expect(JSON.parse(last_response.body)).to have_key 'errors'
    end

    describe "index" do
      it "responds with success status and all existing movies" do
        movie_1 = Movie.create(:title => "Goonies", year: 1985)
        movie_2 = Movie.create(:title => "Back to the Future", year: 1985)

        get path

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq [movie_1, movie_2].to_json
      end
    end
  end

  context "with an existing movie" do
    let!(:movie) { Movie.create(:title => "Goonies", year: 1985) }
    let!(:path) { "/api/v1/movies/#{movie.id}" }

    describe "show" do
      it "responds with success status and movie content when it exists" do
        get path

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq movie.to_json
      end
    end

    describe "update" do
      it "responds with success status successful update" do
        new_genres = ["Adventure", "Commedy", "Family"]

        patch path, movie: { genres: new_genres }

        expect(movie.reload.genres).to match_array new_genres

        expect(last_response.status).to eq 204
        expect(last_response.body.empty?).to be true
      end

      it "responds with bad status on failure" do
        patch path, movie: { title: "" }

        expect(last_response.status).to eq 422
        expect(JSON.parse(last_response.body)).to have_key 'errors'
      end
    end

    describe "destroy" do
      it "destroys a movie" do
        expect {
          delete path
        }.to change { Movie.count }.by(-1)

        expect(last_response.status).to eq 204
      end
    end
  end
end
