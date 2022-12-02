# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    sequence(:name) { |n| "Issue #{n}" }
  end
end
