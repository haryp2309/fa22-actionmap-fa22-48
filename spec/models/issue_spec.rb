# frozen_string_literal: true

describe 'Issue' do
  context 'when I create an issue item' do
    it 'won\'t fail' do
      expect { create(:issue) }.not_to raise_error
    end
  end
end
