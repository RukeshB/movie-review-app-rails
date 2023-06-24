# frozen_string_literal: true

require 'swagger_helper'

# rubocop:disable SRSpec/EmptyExampleGroup:

RSpec.describe('Api::V1::UserReviewRequests', type: :request) do
  describe 'User Review API' do
    path '/api/v1/movies/{movie_id}/user_reviews' do
      post 'create new review' do
        tags 'User Reviews'
        consumes 'application/json'
        parameter name: :movie_id, in: :path, type: :integer, description: 'uniqe id of a movie'
        parameter name: :movie_user_review, in: :body, schema: {
          type: :object,
          properties: {
            rating: { type: :number, format: :double },
            review: { type: :string }
          },
          required: %w[rating review]
        }

        response '201', 'user review created' do
          examples 'application/json' => {
            id: 1,
            user_id: 1,
            movie_id: 1,
            review: 'test 2',
            rating: '5.0',
            movie: {
              id: 1,
              name: 'movie125',
              genre: %w[
                action
                abc
              ],
              language: 'english',
              description: 'test',
              release_date: '2020-01-01',
              length_in_minutes: 138,
              director: [
                'director1'
              ],
              producer: [
                'producer1'
              ],
              writer: [
                'writer1'
              ],
              actor: [
                'actor1'
              ],
              aggregate_review: '5.0',
              cover_image_url: nil
            }
          }
          run_test!
        end

        response '422', 'invalid request' do
          run_test!
        end
      end
    end
  end
end

# rubocop:enable SRSpec/EmptyExampleGroup:
