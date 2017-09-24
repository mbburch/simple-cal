require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "comment creation" do
    it "is valid" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end
end
