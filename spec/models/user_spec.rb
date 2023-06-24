# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  subject do
    described_class.new(
      first_name: 'rukesh',
      last_name: 'basukala',
      role: 'admin',
      email: 'rukesh@gmail.com',
      password: 'Password#123'
    )
  end

  describe 'validations' do
    describe 'invalid' do
      it 'first_name can not be empty' do
        subject.first_name = nil
        expect(subject).not_to(be_valid)
      end

      it 'last_name can not be empty' do
        subject.last_name = nil
        expect(subject).not_to(be_valid)
      end

      it 'role can not be empty' do
        subject.role = nil
        expect(subject).not_to(be_valid)
      end

      it 'email can not be empty' do
        subject.email = nil
        expect(subject).not_to(be_valid)
      end

      it 'password can not be empty' do
        subject.password = nil
        expect(subject).not_to(be_valid)
      end

      it 'password must content atleast 1 uppercase, 1 lowercase, 1 number and 1 special character' do
        subject.password = 'Password'
        expect(subject).not_to(be_valid)
      end
    end

    describe 'valid' do
      it 'user' do
        expect(subject).to(be_valid)
      end
    end
  end
end
