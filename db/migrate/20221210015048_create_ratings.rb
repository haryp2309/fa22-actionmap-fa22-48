# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :stars_count
      t.belongs_to :news_item, index: false
      t.belongs_to :user, index: false
      t.timestamps null: false
    end
  end
end
