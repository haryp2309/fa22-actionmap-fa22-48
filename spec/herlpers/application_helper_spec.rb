# frozen_string_literal: true

describe 'ApplicationHelper' do
  context 'when i run state_ids_by_name' do
    it 'returns valid output' do
      create(:state, name: 'State 1')
      create(:state, name: 'State 2')
      expect(ApplicationHelper.state_ids_by_name.keys).to include('State 1', 'State 2')
    end
  end

  context 'when i run state_symbols_by_name' do
    states = { 'State 1' => 'S1', 'State 2' => 'S2' }
    it 'returns valid output' do
      states.each do |name, symbol|
        create(:state, name: name, symbol: symbol)
      end
      expect(ApplicationHelper.state_symbols_by_name).to eq states
    end
  end
end
