require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'event creation' do
    it 'is valid with required attributes' do
      event = build(:event)
      expect(event).to be_valid
    end

    it 'is invalid without title' do
      event = build(:event, title: '')
      expect(event).not_to be_valid
    end

    it 'is invalid without start_time' do
      event = build(:event, start_time: '')
      expect(event).not_to be_valid
    end

    it 'is invalid without end_time' do
      event = build(:event, end_time: '')
      expect(event).not_to be_valid
    end
  end
end
