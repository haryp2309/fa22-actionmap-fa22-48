# frozen_string_literal: true

require 'securerandom'

FactoryBot.define do
  factory :user do
    uid        { SecureRandom.uuid }
    provider   { User.providers['github'] }
    email      { 'test@test.com' }
    first_name { 'Test' }
    last_name  { 'Testerson' }
  end

  trait :github_user do
    provider   { User.providers['github'] }
  end

  trait :google_user do
    provider   { User.providers['google_oauth2'] }
  end
end
