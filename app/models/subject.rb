class Subject < ActiveRecord::Base
  has_and_belongs_to_many :professors
  
  has_many :plans
  has_many :school_years, through: :plans
end
