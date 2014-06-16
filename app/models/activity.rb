class Activity < ActiveRecord::Base
  validates_presence_of :name, :professor_id, :description, :modality, :img_url, message: "Campo da completare"
  
  belongs_to :professor
end
