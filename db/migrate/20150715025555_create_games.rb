class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :sport
      t.string :date
      t.string :time 
      t.string :location
      t.string :dynamic
      t.decimal :price

      t.timestamps null: false
    end
  end
end
