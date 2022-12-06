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

  context 'when I fetch news from Google News API' do
    before do
      @representative = create(:representative)
      @issue = create(:issue)
    end

    api_key = Rails.application.credentials[:GOOGLE_NEWS_API_KEY]
    newsapi = News.new(api_key)
    top_headlines = newsapi.get_top_headlines(sources: 'bbc-news', pageSize: 5)

    it 'is able to convert GoogleNewsObject into a NewsItem' do
      top_headlines.each do |google_news_obj|
        expect { NewsItem.import_google_news_object(google_news_obj, @representative, @issue) }.not_to raise_error
      end
    end

    news_items = top_headlines.map do |google_news_obj|
      NewsItem.import_google_news_object(google_news_obj, @representative, @issue)
    end

    it 'contains a title, link and description' do
      news_items.each do |news_item|
        expect(news_item.title).not_to be_nil
        expect(news_item.link).not_to be_nil
        expect(news_item.description).not_to be_nil
      end
    end
  end
end
