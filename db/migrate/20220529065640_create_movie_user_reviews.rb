class CreateMovieUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_user_reviews do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :movie, index: true, foreign_key: true
      t.decimal :rating, precision: 5,scale: 2
      t.text :review

      t.timestamps
    end
  end
end
