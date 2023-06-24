# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Movie, type: :model) do
  subject do
    described_class.new(
      name: 'movie1',
      genre: %w[action comedy],
      language: 'english',
      description: 'test movie 1',
      release_date: '2016-08-20',
      director: ['director1'],
      producer: %w[producer1 producer2],
      writer: ['writer1'],
      actor: %w[actor1 actor2 actor3],
      length_in_minutes: 138
    )
  end

  describe 'validations' do
    describe 'invalid' do
      it 'name can not be empty' do
        subject.name = nil
        expect(subject).not_to(be_valid)
      end

      it 'language can not be empty' do
        subject.language = nil
        expect(subject).not_to(be_valid)
      end

      it 'length can not be empty' do
        subject.length_in_minutes = nil
        expect(subject).not_to(be_valid)
      end

      it 'description can not be empty' do
        subject.description = nil
        expect(subject).not_to(be_valid)
      end

      it 'release_date can not be empty' do
        subject.release_date = nil
        expect(subject).not_to(be_valid)
      end

      it 'genre can not be empty' do
        subject.genre = nil
        expect(subject).not_to(be_valid)
      end

      it 'director can not be empty' do
        subject.director = nil
        expect(subject).not_to(be_valid)
      end

      it 'producer can not be empty' do
        subject.producer = nil
        expect(subject).not_to(be_valid)
      end

      it 'writer can not be empty' do
        subject.writer = nil
        expect(subject).not_to(be_valid)
      end

      it 'actor can not be empty' do
        subject.actor = nil
        expect(subject).not_to(be_valid)
      end
    end

    describe 'valid' do
      it 'movie' do
        expect(subject).to(be_valid)
      end
    end
  end
end
