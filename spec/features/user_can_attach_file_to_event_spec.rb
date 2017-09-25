require "rails_helper"

RSpec.describe "User can attach file to event", type: :feature, selenium: true, js: true do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, user_id: user.id) }

  it "through event form" do
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Log in"
    visit edit_event_path(event)
    page.attach_file('event[event_file]', Rails.root + 'spec/support/canyon.jpg')
    click_button "Update Event"
    click_on event.title

    expect(page).to have_content("canyon.jpg")
  end
end