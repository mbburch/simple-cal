class Comment < ApplicationRecord
  belongs_to :event

  scope :sort_by_date, -> { order(created_at: :desc )}
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
