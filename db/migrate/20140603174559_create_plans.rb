class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.belongs_to :subject
      t.belongs_to :school_year
      t.text :program
      t.timestamps
    end
  end
end
