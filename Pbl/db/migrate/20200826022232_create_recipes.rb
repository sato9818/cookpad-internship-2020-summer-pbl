class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :steps, null: false
      t.text :ingredient, null: false
      t.integer :creator_id, null: false
      t.timestamps
    end
  end
end
