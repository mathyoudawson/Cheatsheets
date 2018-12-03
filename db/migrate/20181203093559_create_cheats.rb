class CreateCheats < ActiveRecord::Migration[5.2]
  def change
    create_table :cheats do |t|
      t.string :term
      t.string :description
      t.references :cheatsheet, foreign_key: true

      t.timestamps
    end
  end
end
