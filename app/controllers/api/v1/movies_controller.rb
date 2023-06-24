# frozen_string_literal: true

require 'csv'
class Api::V1::MoviesController < ApplicationController
  prepend_before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_movie, only: %i[show update destroy]
  before_action :authorization, only: %i[create update destroy]

  def index
    @movies = Movie.all
    @movies = Movies::Find.new(@movies, params).execute
    render(json: @movies, status: :ok)
  end

  def download_csv
    @movies = Movie.all
    date_time = DateTime.now.strftime('%y/%d/%m_%H_%M_%S')
    respond_to do |format|
      format.html { send_data(@movies.to_csv, filename: "movies-#{date_time}.csv") }
    end
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render(json: movie, status: :ok)
    else
      render(json: { movies: movie.errors }, status: :unprocessable_entity)
    end
  end

  def show
    if @movie
      render(json: @movie, status: :ok)
    else
      render(json: { movies: movie.errors }, status: :unprocessable_entity)
    end
  end

  def update
    if @movie.update(movie_params)
      render(json: @movie, status: :ok)
    else
      render(json: { movies: movie.errors }, status: :unprocessable_entity)
    end
  end

  def destroy
    @movie.destroy!
    render(status: :ok)
  end

  private

  def movie_params
    params.require(:movie).permit(
      :name,
      :language,
      :description,
      :release_date,
      :length_in_minutes,
      :cover_image,
      genre: [],
      director: [],
      producer: [],
      writer: [],
      actor: []
    )
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def authorization
    authorize(Movie)
  end
end
