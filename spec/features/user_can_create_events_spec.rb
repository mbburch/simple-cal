require "rails_helper"

RSpec.describe "User can create events", type: :feature, selenium: true, js: true do
  before(:each) do
    user = create(:user)
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Log in"
  end

  it "succeeds with valid input" do
    visit dashboard_path
    click_link "New Event"
    fill_in "Title", with: "Ski Day"
    fill_in "Description", with: "Going to the Basin."
    fill_in "From", with: Time.zone.now.strftime("%e%m%Y%I%M%p")
    fill_in "Until", with: 60.minutes.from_now.strftime("%e%m%Y%I%M%p")
    click_button "Create Event"

    expect(page).to have_content("Event was created successfully.")
  end

  it "fails without event title" do
    visit dashboard_path
    click_link "New Event"
    fill_in "Description", with: "Going to the Basin."
    fill_in "From", with: Time.zone.now.strftime("%e%m%Y%I%M%p")
    fill_in "Until", with: 60.minutes.from_now.strftime("%e%m%Y%I%M%p")
    click_button "Create Event"

    expect(page).to have_content("Title can't be blank")
  end

  it "fails without start and end time" do
    visit dashboard_path
    click_link "New Event"
    fill_in "Title", with: "Ski Day"
    fill_in "Description", with: "Going to the Basin."
    click_button "Create Event"

    expect(page).to have_content("Start time can't be blank")
    expect(page).to have_content("End time can't be blank")
  end

  it "with active set to future date" do
    visit dashboard_path
    click_link "New Event"
    fill_in "Title", with: "Ski Day"
    fill_in "Description", with: "Going to the Basin."
    fill_in "From", with: 2.days.from_now.strftime("%e%m%Y%I%M%p")
    fill_in "Until", with: 3.days.from_now.strftime("%e%m%Y%I%M%p")
    page.choose("event_active_false")
    fill_in "Set Active Date?", with: 1.day.from_now.strftime("%e%m%Y")
    click_button "Create Event"

    expect(page).to have_content("Event was created successfully.")
    expect(page).not_to have_content("Ski Day")
  end
end