class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre, array: true
      t.string :language
      t.text :description
      t.date :release_date
      t.string :director, array: true
      t.string :producer, array: true
      t.string :writer, array: true
      t.integer :length_in_minutes
      t.string :actor, array: true

      t.timestamps
    end
    add_index :movies, :name, unique: true
  end
end
