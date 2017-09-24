require "rails_helper"

RSpec.describe Event, type: :model do
  describe "event creation" do
    it "is valid with required attributes" do
      event = build(:event)
      expect(event).to be_valid
    end

    it "is invalid without title" do
      event = build(:event, title: "")
      expect(event).not_to be_valid
    end

    it "is invalid without start_time" do
      event = build(:event, start_time: "")
      expect(event).not_to be_valid
    end

    it "is invalid without end_time" do
      event = build(:event, end_time: "")
      expect(event).not_to be_valid
    end

    it "defaults to private" do
      event = build(:event)
      expect(event.private).to eq(true)
    end

    it "defaults to active" do
      event = build(:event)
      expect(event.active).to eq(true)
    end
  end

  describe "#active" do
    it "returns active events" do
      event = create(:event)
      event2 = create(:event, active: false, active_date: 3.days.from_now)

      expect(Event.active.count).to eq(1)
      expect(Event.active).not_to include(event2)
    end
  end
end
