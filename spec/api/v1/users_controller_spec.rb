require 'spec_helper'

describe API::V1::UsersController, type: :api do

  describe "create" do
    let!(:path) { "/api/v1/users" }

    it "responds with good status on successful creation" do
      expect {
        post path, user: { email: "rafaelcds@gmail.com", name: "Rafael" }
      }.to change { User.count }.by(1)

      expect(last_response.status).to eq 201
      expect(last_response.header["Location"]).to eq "/api/v1/users/#{User.last.id}"
    end

    it "responds with bad status on failure" do
      expect {
        post path, user: { name: "Rafael" }
      }.to_not change { User.count }

      expect(last_response.status).to eq 422
      expect(JSON.parse(last_response.body)).to have_key 'errors'
    end
  end

  context "with an existing user" do
    let(:user) { User.create(:name => "Rafael", email: "rafaelcds@gmail.com") }
    let!(:path) { "/api/v1/users/#{user.id}" }

    describe "show" do
      it "responds with success status and user content when it exists" do
        get path

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq user.to_json
      end
    end

    describe "update" do
      it "responds with success status successful update" do
        new_email = "rafael@hotmail.com"
        patch path, user: { email: new_email }

        expect(user.reload.email).to eq new_email

        expect(last_response.status).to eq 204
        expect(last_response.body.empty?).to be true
      end

      it "responds with bad status on failure" do
        patch path, id: user.id, user: { email: "" }

        expect(last_response.status).to eq 422
        expect(JSON.parse(last_response.body)).to have_key 'errors'
      end
    end

    describe "destroy" do
      it "destroys a user" do
        expect {
          delete path
        }.to change { User.count }.by(-1)

        expect(last_response.status).to eq 204
      end
    end

    context "actions with movie" do
      let!(:movie) { Movie.create title: "Goonies", year: 1985 }
      let!(:path) { "/api/v1/users/#{user.id}/like_movie/#{movie.id}" }

      describe "like_movie" do
        it "responds with good status on successful like to a movie" do
          expect {
            post path, user_id: user.id, movie_id: movie.id
          }.to change { user.movie_likes.count }.by 1

          expect(last_response.status).to eq 201
          expect(last_response.header['Location']).to eq path
        end

        it "responds with bad status on failure" do
          user.like_movie! movie.id

          expect {
            post path, user_id: user.id, movie_id: movie.id
          }.to_not change { user.movie_likes.count }

          expect(last_response.status).to eq 422
        end
      end

      describe "unlike_movie" do
        it "removes like to a movie" do
          user.like_movie! movie.id

          expect {
            delete path, user_id: user.id, movie_id: movie.id
          }.to change { user.movie_likes.count }.by -1

          expect(last_response.status).to eq 204
        end
      end
    end
  end
end
