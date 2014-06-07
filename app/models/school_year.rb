class SchoolYear < ActiveRecord::Base
  has_many :courses
  
  has_many :plans
  has_many :subjects, through: :plans
end
