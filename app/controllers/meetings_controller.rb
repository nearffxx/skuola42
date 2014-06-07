class MeetingsController < ApplicationController
  def index
    @courses = Course.all
    @hash_course_first_year = hash_course_by_year(1,@courses)
    @hash_course_second_year = hash_course_by_year(2,@courses)
    @hash_course_third_year = hash_course_by_year(3,@courses)
    @hash_course_fourth_year = hash_course_by_year(4,@courses)
    @hash_course_fifth_year = hash_course_by_year(5,@courses)
  end

  def show
    init_topic
  end
  
  private
  def hash_course_by_year(year,courses)
    hash_course_meetings = {}
    courses.each do |c|
      if(c.school_year_id == year)
        meetings = c.meetings
        hash_course_meetings[c.name] = meetings if !meetings.empty?
      end
    end
    
    return hash_course_meetings
  end
  
  def init_topic
    @meeting = Meeting.find(params[:id])
    @course = @meeting.course
    @professors = @meeting.professors
  end
end
