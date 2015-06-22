class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :average_rating
end
