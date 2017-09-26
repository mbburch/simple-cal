require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }
  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to eq(200)
    end

    it "redirects if user not signed in" do
      sign_out(user)
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: event }
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "redirects to dashboard upon success" do
      event_attributes = FactoryGirl.attributes_for(:event, user_id: user.id)
      post :create, params: { event: event_attributes }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: event }
      expect(response.status).to eq(200)
    end
  end

  describe "POST #update" do
    it "redirects to dashboard upon success" do
      post :update, params: { id: event, event: { title: "New title" }}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the event" do
      new_event = create(:event, user_id: user.id)
      expect {
        delete :destroy, params: { id: new_event.id }
      }.to change(Event, :count).by(-1)
    end
  end
end