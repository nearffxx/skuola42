class Meeting < ActiveRecord::Base
  validates_presence_of :datetime, :location, :course, message: "Campo da completare"
  
  has_and_belongs_to_many :professors
  
  belongs_to :course
end
