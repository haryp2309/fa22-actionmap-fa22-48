# frozen_string_literal: true

describe 'Event' do
  time_now = Time.parse('2022-11-22 05:41:19 +0000').utc
  context 'when I create a event item' do
    event_params = {
      name:       'Cool Event',
      county:     County.first,
      start_time: Time.parse('2022-11-22 07:41:19 +0000').utc,
      end_time:   Time.parse('2022-11-22 08:41:19 +0000').utc
    }
    it 'won\'t fail' do
      allow(Time).to receive(:now).and_return(time_now)
      expect { Event.create!(event_params) }.not_to raise_error
    end

    Event.create!(event_params)
    event = Event.find_by event_params

    it 'exists' do
      expect(event).not_to be_nil
    end

    it 'county_names_by_id returns nonempty array' do
      expect(event.county_names_by_id.length).to be > 0
    end
  end
end
