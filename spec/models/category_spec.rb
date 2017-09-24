require "rails_helper"

RSpec.describe Category, type: :model do
  describe "category creation" do
    it "is valid" do
      category = build(:category)
      expect(category).to be_valid
    end
  end
end
