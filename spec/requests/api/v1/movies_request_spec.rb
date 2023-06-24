# frozen_string_literal: true

require 'swagger_helper'

# rubocop:disable SRSpec/EmptyExampleGroup:

RSpec.describe('Api::V1::MovieRequests', type: :request) do
  describe('Movies API') do
    path '/api/v1/movies' do
      get 'get all movies' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :search_query, in: :query, type: :string, description: 'name of a movie'
        parameter name: :sort_by_release_date, in: :query, type: :string, enum: %w[asc desc], description: 'sort by relese date'

        response '200', 'OK' do
          examples 'application/json' => [
            {
              id: 1,
              name: 'movie1',
              genre: %w[action comedy],
              language: 'english',
              description: 'test movie 1',
              release_date: '2016-08-20',
              director: ['director1'],
              producer: %w[producer1 producer2],
              writer: ['writer1'],
              actor: %w[actor1 actor2 actor3],
              length_in_minutes: 138,
              aggregate_review: 7.0,
              cover_image_url: nil,
              movie_user_reviews: [
                {
                  id: 1,
                  user_id: 1,
                  movie_id: 1,
                  review: 'test 2',
                  rating: 7.0
                }
              ]
            },
            {
              id: 2,
              name: 'movie2',
              genre: %w[action comedy],
              language: 'english',
              description: 'test movie 1',
              release_date: '2020-08-20',
              director: ['director1'],
              producer: %w[producer1 producer2],
              writer: ['writer1'],
              actor: %w[actor1 actor2],
              aggregate_review: '-',
              cover_image_url: nil,
              movie_user_reviews: []
            }
          ]
          run_test!
        end
      end
    end

    path '/api/v1/movies/{id}' do
      get 'get movies by id' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer, description: 'uniq id of a movie'

        response '200', 'OK' do
          examples 'application/json' => [
            {
              id: 1,
              name: 'movie1',
              genre: %w[action comedy],
              language: 'english',
              description: 'test movie 1',
              release_date: '2016-08-20',
              director: ['director1'],
              producer: %w[producer1 producer2],
              writer: ['writer1'],
              actor: %w[actor1 actor2 actor3],
              length_in_minutes: 138,
              aggregate_review: 7.0,
              cover_image_url: nil,
              movie_user_reviews: [
                {
                  id: 1,
                  user_id: 1,
                  movie_id: 1,
                  review: 'test 2',
                  rating: 7.0
                }
              ]
            }
          ]
          run_test!
        end

        response '404', 'Not Found' do
          run_test!
        end

        response '500', 'Internal Server Error' do
          run_test!
        end
      end
    end

    path '/api/v1/movies' do
      post 'Create a new movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :movie, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            genre: { type: :array, items: { type: :string } },
            language: { type: :string },
            description: { type: :string },
            release_date: { type: :string, format: :date },
            director: { type: :array, items: { type: :string } },
            producer: { type: :array, items: { type: :string } },
            writer: { type: :array, items: { type: :string } },
            actor: { type: :array, items: { type: :string } },
            length_in_minutes: { type: :integer }
          },
          required: %i[name genre language description release_date director producer writer actor length_in_minutes]
        }

        response '201', 'movie created' do
          examples 'application/json' => {
            id: 2,
            name: 'movie2',
            genre: %w[action comedy],
            language: 'english',
            description: 'test movie 1',
            release_date: '2020-08-20',
            director: ['director1'],
            producer: %w[producer1 producer2],
            writer: ['writer1'],
            actor: %w[actor1 actor2],
            aggregate_review: '-',
            cover_image_url: nil,
            movie_user_reviews: []
          }
          run_test!
        end

        response '422', 'Invalid request' do
          run_test!
        end

        response '500', 'Internal Server Error' do
          run_test!
        end

        response '401', 'Unauthorized' do
          run_test!
        end
      end
    end

    path '/api/v1/movies/{id}' do
      patch 'Update a movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer, description: 'uniq id of a movie'
        parameter name: :movie, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            genre: { type: :array, items: { type: :string } },
            language: { type: :string },
            description: { type: :string },
            release_date: { type: :string, format: :date },
            director: { type: :array, items: { type: :string } },
            producer: { type: :array, items: { type: :string } },
            writer: { type: :array, items: { type: :string } },
            actor: { type: :array, items: { type: :string } },
            length_in_minutes: { type: :integer }
          }
        }

        response '200', 'OK' do
          run_test!
        end

        response '422', 'Invalid request' do
          run_test!
        end

        response '500', 'Internal Server Error' do
          run_test!
        end

        response '401', 'Unauthorized' do
          run_test!
        end
      end
    end

    path '/api/v1/movies/{id}' do
      delete 'delete a movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :integer, description: 'uniq id of a movie'

        response '200', 'OK' do
          run_test!
        end

        response '500', 'Internal Server Error' do
          run_test!
        end

        response '401', 'Unauthorized' do
          run_test!
        end
      end
    end
  end
end

# rubocop:enable SRSpec/EmptyExampleGroup:
