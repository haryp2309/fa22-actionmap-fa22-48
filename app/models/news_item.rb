# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  belongs_to :issue
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def json=(json)
    obj = JSON.parse(json)
    self.title = obj['title']
    self.link = obj['url']
    self.description = obj['description']
  end

  def json
    {
      title:       @title,
      link:        @link,
      description: @description
    }.to_json
  end
end
