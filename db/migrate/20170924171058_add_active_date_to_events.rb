class AddActiveDateToEvents < ActiveRecord::Migration[5.1]
  def change
     add_column :events, :active_date, :date
  end
end
