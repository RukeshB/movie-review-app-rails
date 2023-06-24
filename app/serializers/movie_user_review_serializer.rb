# frozen_string_literal: true

class MovieUserReviewSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :movie_id,
             :review,
             :rating

  belongs_to :movie
end
