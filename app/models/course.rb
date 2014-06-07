class Course < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  
  has_many :schedules
  
  has_many :meetings
  
  belongs_to :school_year
  
  has_many :schedules
  has_many :school_days, through: :schedules
end
