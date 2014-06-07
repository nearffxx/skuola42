class SchoolDay < ActiveRecord::Base
  has_many :schedules
  has_many :courses, through: :schedules
end
