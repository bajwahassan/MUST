class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :description
      t.integer :year
      t.integer :watchlist_id
      t.timestamps
    end
  end
end
