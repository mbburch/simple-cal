class AddAttachmentEventFileToEvents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :events do |t|
      t.attachment :event_file
    end
  end

  def self.down
    remove_attachment :events, :event_file
  end
end
