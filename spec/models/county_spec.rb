# frozen_string_literal: true

require 'rails_helper'

describe 'County' do
  context 'when I create a county' do
    state = State.create!(
      name:         'California',
      symbol:       'CA',
      fips_code:    '06',
      is_territory: 0,
      lat_min:      '-124.409591',
      lat_max:      '-114.131211',
      long_min:     '32.534156',
      long_max:     '-114.131211'
    )

    county_parameters = {
      name:       'Alameda County',
      state:      state,
      fips_code:  '1',
      fips_class: 'H1'
    }

    it 'does not fail' do
      expect { County.create!(county_parameters) }.not_to raise_error
    end

    County.create!(county_parameters)
    county = County.find_by(county_parameters)
    it 'exists' do
      expect(county).not_to be_nil
    end

    it 'std_fips_code is correct' do
      expect(county.std_fips_code).to eq '001'
    end
  end
end
