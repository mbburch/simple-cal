require "rails_helper"

RSpec.describe Task, type: :model do
  describe "task creation" do
    it "is valid" do
      task = build(:task)
      expect(task).to be_valid
    end
  end

  describe "#sort_by_priority" do
    it "sorts tasks in descending order by priority" do
      task = create(:task, priority: 0)
      task2 = create(:task, priority: 1)
      expect(Task.sort_by_priority.first).to eq(task2)
      expect(Task.sort_by_priority.last).to eq(task1)
    end
  end
end
