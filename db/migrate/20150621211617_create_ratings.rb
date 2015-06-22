class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars, null: false
      t.references :movie, index: true
      t.timestamps
    end
  end
end
