class Task < ApplicationRecord
  enum priority: [:low, :medium, :high]

  belongs_to :event

  scope :sort_by_priority, -> { order(priority: :desc )}
end

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  priority    :integer          default("low")
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_event_id  (event_id)
#
