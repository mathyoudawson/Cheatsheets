class AddCategoryToCheats < ActiveRecord::Migration[5.2]
  def change
    add_column :cheats, :category, :string
  end
end
