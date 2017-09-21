FactoryGirl.define do
  factory :event do
    user
    title { FFaker::HipsterIpsum.word }
    description { FFaker::HipsterIpsum.sentence }
    start_time { Time.now }
    end_time { rand(60).minutes.from_now }
  end
end

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  start_time  :datetime
#  end_time    :datetime
#  active      :boolean          default(TRUE)
#  private     :boolean          default(TRUE)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
