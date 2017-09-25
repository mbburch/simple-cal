require "rails_helper"

RSpec.describe "User can manage comments", type: :feature, selenium: true, js: true do
  before(:each) do
    user = create(:user)
    @event = create(:event, user_id: user.id)
    @comment = create(:comment, event_id: @event.id)
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Log in"
    visit edit_event_path(@event)
  end

  it "adding comment through event form" do
    click_link "Add Comment"
    within all(".event_comments_comment").last do
      fill_in "Comment", with: "Do lunges"
    end
    click_button "Update Event"
    click_on @event.title

    within(".comment-list") do
      expect(page).to have_content("Do lunges")
    end
  end

  it "editing comment through event form" do
    within(".event_comments_comment") do
      fill_in "Comment", with: "Buy skis"
    end
    click_button "Update Event"
    click_on @event.title

    within(".comment-list") do
      expect(page).to have_content("Buy skis")
    end
  end

  it "removing comment through event form" do
    click_link "Remove Comment"
    click_button "Update Event"
    click_on @event.title

    within(".comment-list") do
      expect(page).not_to have_content(@comment.comment)
    end
  end
end