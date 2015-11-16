class RemoveGamesColumn < ActiveRecord::Migration
  def change
  	remove_column :games, :number, :string
  end
end
