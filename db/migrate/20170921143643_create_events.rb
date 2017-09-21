class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active, default: true
      t.boolean :private, default: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
