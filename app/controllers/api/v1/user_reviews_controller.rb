# frozen_string_literal: true

class Api::V1::UserReviewsController < ApplicationController
  prepend_before_action :authenticate_user!, only: [:create]
  before_action :set_movie, only: [:create]

  def create
    authorize(MovieUserReview)
    params[:movie_user_review][:user_id] = current_user.id
    review = @movie.movie_user_reviews.build(review_params)
    if review.save
      render(json: review, status: :ok)
    else
      render(json: { movie_user_review: review.errors }, status: :unprocessable_entity)
    end
  end

  private

  def review_params
    params.require(:movie_user_review).permit(
      :review,
      :rating,
      :user_id,
      :movie_id
    )
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
