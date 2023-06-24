# frozen_string_literal: true

class User < ApplicationRecord
  has_many :movie_user_reviews, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  # enum for user role
  enum role: { admin: Constant::ADMIN, audience: Constant::AUDIENCE }

  # validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  # custom validation for password
  validate :password_validation

  def password_validation
    rules = {
      I18n.t('validation_errors.invalid_password.missing_lowercase') => /[a-z]+/,
      I18n.t('validation_errors.invalid_password.missing_uppercase') => /[A-Z]+/,
      I18n.t('validation_errors.invalid_password.missing_digit') => /\d+/,
      I18n.t('validation_errors.invalid_password.missing_special_char') => /[^A-Za-z0-9]+/
    }

    rules.each do |message, regex|
      errors.add(:password, message) if password.present? && !password.match(regex)
    end
  end
end
