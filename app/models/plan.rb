class Plan < ActiveRecord::Base
  belongs_to :subject
  belongs_to :school_year
end
