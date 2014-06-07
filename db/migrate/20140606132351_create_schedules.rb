class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :course
      t.belongs_to :school_day
      t.text :lessons
      t.timestamps
    end
  end
end
