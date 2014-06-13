class Event < ActiveRecord::Base
  validates_presence_of :name, :event_type_id, :structure_id, :description, :participations, :datetime, message: "Campo da completare"
  
  has_and_belongs_to_many :subjects
  belongs_to :structure
  belongs_to :event_type
end
