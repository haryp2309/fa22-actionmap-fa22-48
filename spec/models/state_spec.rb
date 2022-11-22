# frozen_string_literal: true

require 'rails_helper'

describe 'State' do
  context 'when I create a State' do
    state_params = {
      name:         'California',
      symbol:       'CA',
      fips_code:    '6',
      is_territory: 0,
      lat_min:      '-124.409591',
      lat_max:      '-114.131211',
      long_min:     '32.534156',
      long_max:     '-114.131211'
    }

    it 'does not fail' do
      expect { State.create!(state_params) }.not_to raise_error
    end

    state = State.create!(state_params)

    it 'std_fips_code is correct' do
      expect(state.std_fips_code).to eq '06'
    end
  end
end
