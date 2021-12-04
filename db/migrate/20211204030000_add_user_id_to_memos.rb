class AddUserIdToMemos < ActiveRecord::Migration[6.0]
  def change
    add_reference :memos, :user, foreign_key: true
  end
end
