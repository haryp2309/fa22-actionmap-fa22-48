# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

describe 'User' do
  context 'when I create a user' do
    it 'has correct name' do
      expect(create(:user).name).to eq 'Test Testerson'
    end
  end

  context 'when I create a Google-user' do
    it 'has correct auth provicer' do
      expect(create(:user, :google_user).auth_provider).to eq 'Google'
    end
  end

  context 'when I create a Github-user' do
    it 'has correct auth provicer' do
      expect(create(:user, :github_user).auth_provider).to eq 'Github'
    end
  end
end
