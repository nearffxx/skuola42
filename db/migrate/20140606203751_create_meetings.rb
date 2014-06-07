class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :datetime
      t.string :location
      t.belongs_to :course
      
      t.timestamps
    end
  end
end
