class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :telephone
      t.string :img_url
      
      t.timestamps
    end
  end
end
