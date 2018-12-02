class AddTitleToCheatsheets < ActiveRecord::Migration[5.2]
  def change
    add_column :cheatsheets, :title, :string
  end
end
