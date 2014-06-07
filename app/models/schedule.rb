class Schedule < ActiveRecord::Base
  belongs_to :course
  belongs_to :school_day
end
