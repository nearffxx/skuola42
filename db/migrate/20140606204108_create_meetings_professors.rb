class CreateMeetingsProfessors < ActiveRecord::Migration
  def change
    create_table :meetings_professors do |t|
      t.integer :meeting_id
      t.integer :professor_id
    end
  end
end
