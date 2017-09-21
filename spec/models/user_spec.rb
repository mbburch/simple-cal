require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creating user' do
    it 'is valid with required attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without email' do
      user = build(:user, email: '')
      expect(user).not_to be_valid
    end
  end
end