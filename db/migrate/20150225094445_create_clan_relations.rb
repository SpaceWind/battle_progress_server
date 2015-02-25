class CreateClanRelations < ActiveRecord::Migration
  def change
    create_table :clan_relations do |t|
      t.string :type
      t.string :name
      t.string :string
      t.string :hostile
      t.string :text
      t.string :friendly
      t.string :text

      t.timestamps
    end
  end
end
