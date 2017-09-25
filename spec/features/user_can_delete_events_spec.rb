require "rails_helper"

RSpec.describe "User can delete events", type: :feature, selenium: true, js: true do
  before(:each) do
    @user = create(:user)
    @event = create(:event, user_id: @user.id)
    @task = create(:task, event_id: @event.id)
    @comment = create(:comment, event_id: @event.id)
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
    end
    click_button "Log in"
    visit event_path(@event)
  end

  it "deletes event" do
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Event was successfully destroyed.")
    expect(@user.events.count).to eq(0)
  end

  it "deletes associated tasks" do
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Event was successfully destroyed.")
    expect(@event.tasks.count).to eq(0)
  end

  it "deletes associated comments" do
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Event was successfully destroyed.")
    expect(@event.comments.count).to eq(0)
  end
end