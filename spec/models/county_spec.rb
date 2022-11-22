# frozen_string_literal: true

require 'rails_helper'

describe 'County' do
  context 'when I create a county' do
    it 'does not fail' do
      expect { create(:county) }.not_to raise_error
    end

    it 'std_fips_code is correct' do
      expect(create(:county, fips_code: 2).std_fips_code).to eq '002'
    end
  end
end
