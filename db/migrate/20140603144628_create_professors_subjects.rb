class CreateProfessorsSubjects < ActiveRecord::Migration
  def change
    create_table :professors_subjects do |t|
      t.integer :professor_id
      t.integer :subject_id
    end
  end
end
