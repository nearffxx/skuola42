class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.text :program
      t.string :img_url
      
      t.timestamps
    end
  end
end
