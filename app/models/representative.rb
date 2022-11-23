# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all
  serialize :contact_address, Array

  def self.civic_api_to_representative_params(rep_info)
    rep_info.officials.each_with_index.map do |official, index|
      office = rep_info.offices.find { |o| o.official_indices.include? index }
      Representative.find_or_create_by!(
        {
          name:            official.name,
          ocdid:           office.division_id,
          title:           office.name,
          contact_address: official.address&.map { |a| a.to_h.stringify_keys },
          political_party: official.party,
          photo_url:       official.photo_url
        }
      )
    end
  end
end
