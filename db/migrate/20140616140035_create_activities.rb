class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.belongs_to :professor
      t.text :modality
      t.text :description
      t.string :img_url
      
      t.timestamps
    end
  end
end
