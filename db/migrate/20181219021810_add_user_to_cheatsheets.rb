class AddUserToCheatsheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :cheatsheets, :user, foreign_key: true
  end
end
