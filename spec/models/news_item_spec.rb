# frozen_string_literal: true

require 'news-api'

describe 'NewsItem' do
  context 'when I create a NewsItem' do
    it 'find_for should return correct representative' do
      original_news_item = create(:news_item)
      expect(NewsItem.find_for(original_news_item.representative)).to eq(original_news_item)
    end

    it 'is able to be linked to an issue' do
      issues = create_list(:issue, 10)
      expect { create(:news_item, issue: issues[2]) }.not_to raise_error
    end

    it 'is able read the issue name' do
      create_list(:issue, 10)
      issue = create(:issue, name: 'Really interesting issue!')
      news_item = create(:news_item, issue: issue)
      expect(news_item.issue.name).to eq(issue.name)
    end
  end
end
