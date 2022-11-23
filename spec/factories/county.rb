# frozen_string_literal: true

FactoryBot.define do
  factory :county do
    name { 'Alameda County' }
    state      { create(:state) }
    fips_code  { '1' }
    fips_class { 'H1' }
  end
end
