class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.text :ques
  		t.string :ans
  		t.integer :dis_order
  		t.timestamps
  	end
  end
end
