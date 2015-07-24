class AddFieldnamesToGamesTable < ActiveRecord::Migration
  def change
  	add_column :games, :city, :string
  	add_column :games, :state, :string
  	add_column :games, :zip, :string
  end
end
