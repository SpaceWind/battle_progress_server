class CreateHeroDescriptors < ActiveRecord::Migration
  def change
    create_table :hero_descriptors do |t|
      t.string :heroid
      t.string :name
      t.integer :lvl
      t.integer :mood
      t.text :map
      t.integer :pack_max_size
      t.integer :exp
      t.integer :exp_to_next_lvl
      t.integer :x
      t.integer :y
      t.string :class
      t.string :race

      t.timestamps
    end
  end
end
