class CreateRabbits < ActiveRecord::Migration
  def up
  	create_table :rabbits do |t|
  		t.string :name 
  		t.text   :description
  		t.integer :age 
  		t.string :colour
  		t.timestamps
  		
  end

  def down
  end
end

