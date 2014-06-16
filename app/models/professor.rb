class Professor < ActiveRecord::Base
  validates_presence_of :name, :surname, :email, :telephone, :img_url, message: "Campo da completare"
  
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :meetings
  
  has_many :activities
end
