# frozen_string_literal: true

class Rating < ApplicationRecord
  def self.available_rating_values
    [1, 2, 3, 4, 5]
  end
end
