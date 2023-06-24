# frozen_string_literal: true

require 'swagger_helper'

# rubocop:disable SRSpec/EmptyExampleGroup:

RSpec.describe('UserRequests', type: :request) do
  describe('User API') do
    path '/users/sign_in' do
      post 'user login' do
        tags 'Users'
        consumes 'application/json'
        security []
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          required: %w[email password]
        }

        response '200', 'OK' do
          run_test!
        end
      end
    end
  end
end

# rubocop:enable SRSpec/EmptyExampleGroup:
