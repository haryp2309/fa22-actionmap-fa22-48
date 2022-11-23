# frozen_string_literal: true

describe 'Event' do
  time_now = Time.parse('2022-11-22 05:41:19 +0000').utc
  context 'when I create a event item' do
    it 'won\'t fail' do
      allow(Time).to receive(:now).and_return(time_now)
      expect { create(:event) }.not_to raise_error
    end

    it 'county_names_by_id returns nonempty array' do
      allow(Time).to receive(:now).and_return(time_now)
      state = create(:state)
      county1 = create(:county, state: state, name: 'County 1')
      create(:county, state: state, name: 'County 2')
      expect(create(:event, county: county1).county_names_by_id.keys).to include('County 1', 'County 2')
    end
  end
end
