class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :location
      t.string :books
      t.string :extra_materials
      t.belongs_to :school_year
      
      t.timestamps
    end
  end
end
