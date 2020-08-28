class CreateVideoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :video_comments do |t|
      t.integer :user_id, null: false
      t.integer :video_id, null: false
      t.text :comments, null: false
      t.timestamps
    end
  end
end
