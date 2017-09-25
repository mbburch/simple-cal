require "rails_helper"

RSpec.describe "User can manage tasks", type: :feature, selenium: true, js: true do
  before(:each) do
    user = create(:user)
    @event = create(:event, user_id: user.id)
    @task = create(:task, event_id: @event.id)
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Log in"
    visit edit_event_path(@event)
  end

  it "adding task through event form" do
    click_link "Add Task"
    within all(".event_tasks_description").last do
      fill_in "Description", with: "Do lunges"
    end
    click_button "Update Event"
    click_on @event.title

    within(".task-list") do
      expect(page).to have_content("Do lunges")
    end
  end

  it "editing task through event form" do
    within(".event_tasks_description") do
      fill_in "Description", with: "Buy skis"
    end
    click_button "Update Event"
    click_on @event.title

    within(".task-list") do
      expect(page).to have_content("Buy skis")
    end
  end

  it "removing task through event form" do
    click_link "Remove Task"
    click_button "Update Event"
    click_on @event.title

    within(".task-list") do
      expect(page).not_to have_content(@task.description)
    end
  end
end