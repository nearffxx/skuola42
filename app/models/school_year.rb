class SchoolYear < ActiveRecord::Base
  validates :year, uniqueness: true
  
  has_many :plans
  has_many :subjects, through: :plans
end
