class Event < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  belongs_to :structure
  belongs_to :event_type
end
