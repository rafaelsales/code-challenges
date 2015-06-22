Movie.find_or_create_by!(title: 'The Goonies', year: 1985).tap do |m|
  m.ratings.create!(stars: 4)
  m.ratings.create!(stars: 5)
end

Movie.find_or_create_by!(title: 'Back to the Future', year: 1985)
Movie.find_or_create_by!(title: 'Back to the Future Part II', year: 1989)
Movie.find_or_create_by!(title: 'Back to the Future Part III', year: 1990)

Movie.find_or_create_by!(title: 'Super 8', year: 2011).tap do |m|
  m.ratings.create!(stars: 3)
  m.ratings.create!(stars: 4)
end
