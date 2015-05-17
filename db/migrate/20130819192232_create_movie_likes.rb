class CreateMovieLikes < ActiveRecord::Migration
  def change
    create_table :movie_likes do |t|
      t.references :user
      t.references :movie
    end
  end
end
