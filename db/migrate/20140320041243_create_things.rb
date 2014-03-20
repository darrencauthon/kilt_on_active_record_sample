class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :unique_id
      t.string :name
      t.string :object_type
      t.string :slug
      t.text :data

      t.timestamps
    end
  end
end
