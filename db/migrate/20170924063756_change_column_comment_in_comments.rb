class ChangeColumnCommentInComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :comment, :text
  end
end
