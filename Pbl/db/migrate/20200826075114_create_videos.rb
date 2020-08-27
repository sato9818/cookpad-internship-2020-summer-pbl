class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :description
      t.integer :recipe_id 
      t.string :url, null: false

      t.timestamps
    end
  end
end
