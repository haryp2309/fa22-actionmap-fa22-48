# frozen_string_literal: true

require 'rails_helper'
require 'google/apis/civicinfo_v2'

def get_officials(address)
  service = Google::Apis::CivicinfoV2::CivicInfoService.new
  service.key = Rails.application.credentials[:GOOGLE_API_KEY]
  service.representative_info_by_address(address: address)
end

describe 'Representative' do
  context 'when I convert Civic API response to representative objects' do
    result = get_officials('Berkeley')

    Representative.delete_all
    Representative.civic_api_to_representative_params(result)

    initial_count = Representative.count

    it 'the count of objects in the database should be greater than zero' do
      expect(initial_count).to be > 0
    end

    Representative.civic_api_to_representative_params(result)
    new_count = Representative.count

    it 'does not create duplicate entries if the representative already exists' do
      expect(new_count).to eq(initial_count)
    end
  end
end
