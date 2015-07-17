class AddCreatorIdToGamesTable < ActiveRecord::Migration
  def change
  	add_column :games, :creator_id, :integer
  	add_index :games, :creator_id
  end
end
