class AddDescriptionToCheatsheets < ActiveRecord::Migration[5.2]
  def change
    add_column :cheatsheets, :description, :string
  end
end
