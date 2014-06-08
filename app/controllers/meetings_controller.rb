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
    init_from_page
  end
  
  def new
    @meeting = Meeting.new
    @professors = Professor.order(surname: :asc)
    @courses = Course.order(name: :asc)
  end
  
  def create
    params[:meeting][:professor_ids].delete("")
    professor_ids = params[:meeting][:professor_ids]
    professors = Professor.find(professor_ids)
    params[:meeting].delete(:professor_ids)
    meeting = Meeting.create(meeting_params)
    meeting.professors << professors
    redirect_to editorials_path
  end
  
  def init_topic
    @meeting = Meeting.find(params[:id])
    @course = @meeting.course
    @professors = @meeting.professors
  end
  
  def init_from_page
    @from_professor_id = params[:from_professor]
    @from_professor = Professor.find(@from_professor_id) if @from_professor_id
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
  
  private
  def meeting_params
    params.require(:meeting).permit(:datetime, :location, :course_id)
  end
  
end
