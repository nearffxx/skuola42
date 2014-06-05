class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :event_type
      t.belongs_to :structure
      t.text :description
      t.text :participations
      t.datetime :datetime
      
      t.timestamps
    end
  end
end
