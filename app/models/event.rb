class Event < ApplicationRecord
  has_attached_file :event_file

  belongs_to :user
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates_attachment :event_file,
  content_type: { content_type: [
    "application/pdf",
    "application/doc",
    "application/docx",
    "image/jpeg",
    "image/jpg",
    "image/gif",
    "image/png"
  ] }

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
