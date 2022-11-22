# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

describe 'User' do
  context 'when I create a Google-user' do
    user_params = {
      uid:        SecureRandom.uuid,
      provider:   User.providers['google_oauth2'],
      email:      'test@test.com',
      first_name: 'Test',
      last_name:  'Testerson'
    }

    it 'does not fail' do
      expect { User.create!(user_params) }.not_to raise_error
    end

    User.create!(user_params)

    user = User.find_google_user(user_params[:uid])

    it 'does find the user' do
      expect(user).not_to be_nil
    end

    it 'has correct name' do
      expect(user.name).to eq 'Test Testerson'
    end

    it 'has correct auth provicer' do
      expect(user.auth_provider).to eq 'Google'
    end
  end

  context 'when I create a Github-user' do
    user_params = {
      uid:        SecureRandom.uuid,
      provider:   User.providers['github'],
      email:      'test@test.com',
      first_name: 'Test',
      last_name:  'Testerson'
    }

    it 'does not fail' do
      expect { User.create!(user_params) }.not_to raise_error
    end

    User.create!(user_params)

    user = User.find_github_user(user_params[:uid])

    it 'does find the user' do
      expect(user).not_to be_nil
    end

    it 'has correct name' do
      expect(user.name).to eq 'Test Testerson'
    end

    it 'has correct auth provicer' do
      expect(user.auth_provider).to eq 'Github'
    end
  end
end
