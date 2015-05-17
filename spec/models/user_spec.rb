require 'spec_helper'

describe User do

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  context "with user and movie" do
    before do
      @user = User.create name: "Rafael", email: "rafaelcds@gmail.com"
      @movie = Movie.create title: "Back to the Future", year: 1985
    end

    describe "like_movie!" do
      it "makes the user like a movie" do
        expect {
          @user.like_movie! @movie.id
        }.to change { @user.movie_likes.where(movie_id: @movie.id).count }.by 1
      end

      it "does not allow the user like a movie twice" do
        @user.like_movie! @movie.id

        expect {
          @user.like_movie! @movie.id
        }.to change { @user.movie_likes.where(movie_id: @movie.id).count }.by 0
      end
    end

    describe "unlike_movie!" do
      it "removes the user like to a movie" do
        @user.like_movie! @movie.id

        expect {
          @user.unlike_movie! @movie.id
        }.to change { @user.movie_likes.where(movie_id: @movie.id).count }.by -1
      end

      it "raise an error if the like does not exist" do
        @user.like_movie! @movie.id
        another_movie = Movie.create(title: "Goonies", year: 1985)

        expect {
          @user.unlike_movie! another_movie.id
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
