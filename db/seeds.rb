admin  = User.find_or_initialize_by(email: 'admin@favmovie.com').tap { |u| u.update!(role: :admin, password: 'qwerty') }
rafael = User.find_or_initialize_by(email: 'rafael@favmovie.com').tap { |u| u.update!(role: :user, password: 'qwerty') }
franze = User.find_or_initialize_by(email: 'franze@favmovie.com').tap { |u| u.update!(role: :user, password: 'qwerty') }

Movie.find_or_create_by!(title: 'The Goonies', year: 1985).tap do |m|
  m.ratings.find_or_create_by!(stars: 4)
  m.ratings.find_or_create_by!(stars: 5)
end

Movie.find_or_create_by!(title: 'Back to the Future', year: 1985)
Movie.find_or_create_by!(title: 'Back to the Future Part II', year: 1989)
Movie.find_or_create_by!(title: 'Back to the Future Part III', year: 1990)

Movie.find_or_create_by!(title: 'Super 8', year: 2011).tap do |m|
  m.ratings.find_or_create_by!(stars: 3)
  m.ratings.find_or_create_by!(stars: 4)
end
