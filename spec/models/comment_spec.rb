require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "comment creation" do
    it "is valid" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    describe "#sort_by_date" do
      it "sorts comments in descending order by priority" do
        comment = create(:comment)
        comment2 = create(:comment)
        expect(Comment.sort_by_date.first).to eq(comment2)
        expect(Comment.sort_by_date.last).to eq(comment)
      end
    end
  end
end
