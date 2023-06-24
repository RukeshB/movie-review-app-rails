# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :genre,
             :language,
             :description,
             :release_date,
             :length_in_minutes,
             :director,
             :producer,
             :writer,
             :actor,
             :aggregate_review,
             :cover_image_url

  has_many :movie_user_reviews
end
