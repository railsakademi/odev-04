class MoviesCategories < ActiveRecord::Migration
  def change
    create_table :categories_movies do |t|
      t.references :movie
      t.references :category

      t.timestamps null: true
    end
  end
end
