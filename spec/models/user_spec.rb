require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user creation' do
    it 'is valid with required attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without email' do
      user = build(:user, email: '')
      expect(user).not_to be_valid
    end

    it 'is invalid with incorrect password_confirmation' do
      user = build(:user, password_confirmation: 'passWord')
      expect(user).not_to be_valid
    end
  end
end
