class CreateClassSpecs < ActiveRecord::Migration
  def change
    create_table :class_specs do |t|
      t.string :class_name
      t.integer :str
      t.integer :dex
      t.integer :mag
      t.string :tra
      t.integer :vel
      t.integer :hp
      t.string :mana
	  
      t.timestamps
    end
  end
end
