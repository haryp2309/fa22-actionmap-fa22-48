# frozen_string_literal: true

class AddIssueColumnToNewsItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :news_items, :issue, index: false
  end
end
