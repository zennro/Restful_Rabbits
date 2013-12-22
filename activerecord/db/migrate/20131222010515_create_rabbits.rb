class CreateRabbits < ActiveRecord::Migration
  def up
  	create_table :rabbits do |t|
  		t.string :name 
  		t.text   :description
  		t.integer :age 
  		t.string :colour
  		t.timestamps
    end
  end 

  def down
    drop_table :rabbits
  end
end
