class CreateRecipesVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes_videos do |t|
      t.integer :recipe_id, null: false
      t.integer :video_id, null: false
      t.timestamps
    end
  end
end
