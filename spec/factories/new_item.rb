# frozen_string_literal: true

FactoryBot.define do
  factory :news_item do
    title { 'Interessting news' }
    link { 'fake.news.do.not.follow.this.link.com' }
    representative { create(:representative) }
  end
end
