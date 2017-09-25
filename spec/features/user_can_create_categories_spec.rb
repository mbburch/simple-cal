require "rails_helper"

RSpec.describe "User can create categories", type: :feature, selenium: true, js: true do
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
    click_link "New Category"
    fill_in "Name", with: "Family"
    fill_in "Color", with: "#42bcf4"
    click_button "Create Category"

    expect(page).to have_content("Category was created successfully.")
    expect(page).to have_content("Family")
  end
end