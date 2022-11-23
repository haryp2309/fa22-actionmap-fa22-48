# frozen_string_literal: true

describe 'NewsItem' do
  context 'when I create a NewsItem' do
    it 'find_for should return correct representative' do
      original_news_item = create(:news_item)
      expect(NewsItem.find_for(original_news_item.representative)).to eq(original_news_item)
    end
  end
end
