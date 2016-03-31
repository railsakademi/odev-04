class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :movie
      t.references :user
      t.decimal :point, precision: 0, scale: 2

      t.timestamps null: false
    end
  end
end
