# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'Cool Event' }
    county     { create(:county) }
    start_time { Time.parse('2022-11-22 07:41:19 +0000').utc }
    end_time   { Time.parse('2022-11-22 08:41:19 +0000').utc }
  end
end
