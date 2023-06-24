# frozen_string_literal: true

class MovieUserReview < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :review, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
