require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user_id: user.id) }
  before { sign_in user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "redirects to dashboard upon success" do
      category_attributes = FactoryGirl.attributes_for(:category, user_id: user.id)
      post :create, params: { category: category_attributes }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: category }
      expect(response.status).to eq(200)
    end
  end

  describe "POST #update" do
    it "redirects to dashboard upon success" do
      post :update, params: { id: category, category: { name: "Birthdays" }}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end
  end
end