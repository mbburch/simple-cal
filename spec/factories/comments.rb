FactoryGirl.define do
  factory :comment do
    event
    comment { Faker::Hipster.sentence }
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_event_id  (event_id)
#
