# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# admin seed
User.create!(
  {
    first_name: 'shyam',
    last_name: 'basu',
    email: 'shyam@gmail.com',
    role: 'admin',
    password: Rails.application.credentials.user.password
  }
).confirm
User.create!(
  {
    first_name: 'ram',
    last_name: 'basu',
    email: 'ram@gmail.com',
    role: 'admin',
    password: Rails.application.credentials.user.password
  }
).confirm

# movie seed
Movie.create!(
  [
    {
      name: 'Doctor Strange in the Multiverse of Madness',
      genre: %w[action adventure fantasy],
      language: 'english',
      description: 'While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.',
      release_date: Date.parse('2022-05-06'),
      director: ['Sam Raimi'],
      producer: ['Kevin Feige'],
      writer: ['Michael Waldron'],
      actor: ['Benedict Cumberbatch', 'Elizabeth Olsen', 'Chiwetel Ejiofor'],
      length_in_minutes: 126
    },
    {
      name: 'Sonic the Hedgehog 2',
      genre: %w[action adventure comedy],
      language: 'english',
      description: 'When the manic Dr Robotnik returns to Earth with a new ally, Knuckles the Echidna, Sonic and his new friend Tails is all that
                    stands in their way.',
      release_date: Date.parse('2020-04-08'),
      director: ['Jeff Fowler'],
      producer: ['Neal H. Moritz', 'Toby Ascher'],
      writer: ['Pat Casey', 'Josh Miller', 'John Whittington'],
      actor: ['Ben Schwartz(voice)', 'James Marsden', 'Jim Carrey'],
      length_in_minutes: 122
    }
  ]
)
