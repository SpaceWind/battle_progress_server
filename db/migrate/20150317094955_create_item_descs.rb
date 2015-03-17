class CreateItemDescs < ActiveRecord::Migration
  def change
    create_table :item_descs do |t|
      t.string :item_id
      t.string :item_name
      t.text :look
      t.string :owner_hero_id
      t.string :slot
      t.int :value
      t.int :worth
      t.int :weight
      t.text :history

      t.timestamps
    end
  end
end
