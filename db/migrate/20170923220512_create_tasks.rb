class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :priority, default: 0
      t.references :event

      t.timestamps
    end
  end
end
