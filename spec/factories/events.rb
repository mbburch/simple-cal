FactoryGirl.define do
  factory :event do
    user
    title { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
    start_time { Time.now }
    end_time { rand(60).minutes.from_now }
  end
end

# == Schema Information
#
# Table name: events
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :text
#  start_time              :datetime
#  end_time                :datetime
#  active                  :boolean          default(TRUE)
#  private                 :boolean          default(TRUE)
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  event_file_file_name    :string
#  event_file_content_type :string
#  event_file_file_size    :integer
#  event_file_updated_at   :datetime
#  category_id             :integer
#
# Indexes
#
#  index_events_on_category_id  (category_id)
#  index_events_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
