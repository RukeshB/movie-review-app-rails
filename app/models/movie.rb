# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_user_reviews, dependent: :destroy

  has_one_attached :cover_image

  # validation
  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :language, presence: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :length_in_minutes, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :writer, presence: true
  validates :actor, presence: true

  def aggregate_review
    total_rating = 0.0
    if movie_user_reviews.empty?
      '-'
    else
      movie_user_reviews.each do |review|
        total_rating += review.rating
      end

      aggregate = total_rating / movie_user_reviews.length
      aggregate.round(2)
    end
  end

  def cover_image_url
    cover_image.url if cover_image.attached?
  end

  # method to export to csv
  def self.to_csv
    attributes = %w[id name aggregate_review]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.find_each do |movie|
        csv << attributes.map { |attr| movie.send(attr) }
      end
    end
  end
end
