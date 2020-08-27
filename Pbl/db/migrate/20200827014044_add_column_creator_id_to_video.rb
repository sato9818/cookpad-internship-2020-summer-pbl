class AddColumnCreatorIdToVideo < ActiveRecord::Migration[5.2]
  def up
    add_column :videos, :creator_id, :integer
  end

  def down
    remove_column :videos, :creator_id, :integer
  end
end
