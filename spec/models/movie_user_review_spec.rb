# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MovieUserReview, type: :model) do
  subject do
    described_class.create!(
      user_id: user.id,
      movie_id: movie.id,
      rating: 7.5,
      review: 'test'
    )
  end

  let(:user) do
    User.create!(
      first_name: 'rukesh',
      last_name: 'basukala',
      role: 'admin',
      email: 'abcdef@abc.com',
      password: 'Password#123'
    )
  end

  let(:movie) do
    Movie.create!(
      name: 'movie1',
      genre: %w[action comedy],
      language: 'english',
      description: 'test movie 1',
      release_date: Date.parse('2016-08-20'),
      director: ['director1'],
      producer: %w[producer1 producer2],
      writer: ['writer1'],
      actor: %w[actor1 actor2 actor3],
      length_in_minutes: 138
    )
  end

  describe 'validations' do
    describe 'invalid' do
      it 'rating can not be empty' do
        subject.rating = nil
        expect(subject).not_to(be_valid)
      end

      it 'rating must be greater then equal to and less then equal too 10' do
        subject.rating = 10.5
        expect(subject).not_to(be_valid)
      end

      it 'review can not be empty' do
        subject.review = nil
        expect(subject).not_to(be_valid)
      end
    end

    describe 'valid' do
      it 'user review' do
        expect(subject).to(be_valid)
      end
    end
  end
end
