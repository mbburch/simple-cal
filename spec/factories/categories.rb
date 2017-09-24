FactoryGirl.define do
  factory :category do
    name { Faker::StarWars.planet }
    color { Faker::Color.hex_color }
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  color      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_user_id  (user_id)
#
