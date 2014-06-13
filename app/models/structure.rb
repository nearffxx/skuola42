class Structure < ActiveRecord::Base
  validates_presence_of :name, :description, :img_url, message: "Campo da completare"
  
  has_many :events
end
