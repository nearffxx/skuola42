class CreateStructures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.string :name
      t.text :description
      t.string :img_url
      
      t.timestamps
    end
  end
end
