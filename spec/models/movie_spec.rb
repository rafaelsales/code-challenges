require 'spec_helper'

describe Movie do
  it "can store and retrieve a serialized array of genres" do
    genres = ["Adventure, Sci-Fi, Comedy"]
    Movie.create(title: "Back to the Future", year: 1985, genres: genres)

    expect(Movie.last.genres).to match_array genres
  end
end
