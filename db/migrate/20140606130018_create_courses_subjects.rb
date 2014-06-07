class CreateCoursesSubjects < ActiveRecord::Migration
  def change
    create_table :courses_subjects do |t|
      t.integer :course_id
      t.integer :subject_id
    end
  end
end
