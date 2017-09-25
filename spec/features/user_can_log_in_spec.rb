require "rails_helper"

RSpec.describe "User can log in", type: :feature do
  before(:each) do
    @user = create(:user)
    visit new_user_session_path
  end

  it "succeeds with correct credentials" do
    within("#new_user") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
    end
    click_button "Log in"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content "Signed in successfully"
  end

  it "fails with incorrect credentials" do
    within("#new_user") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: "Incorrect"
    end
    click_button "Log in"
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content "Invalid Email or password"
  end
end
