class SubjectsController < ApplicationController
  include ApplicationHelper
  
  def index
    @first_school_year = SchoolYear.find(1)
    @first_year_subjects = @first_school_year.subjects.order(name: :asc)
    
    @second_school_year = SchoolYear.find(2)
    @second_year_subjects = @second_school_year.subjects.order(name: :asc)
    
    @third_school_year = SchoolYear.find(3)
    @third_year_subjects = @third_school_year.subjects.order(name: :asc)
    
    @fourth_school_year = SchoolYear.find(4)
    @fourth_year_subjects = @fourth_school_year.subjects.order(name: :asc)
    
    @fifth_school_year = SchoolYear.find(5)
    @fifth_year_subjects = @fifth_school_year.subjects.order(name: :asc)
  end

  def show
    init_topic
    init_from_page
    init_tour
  end
  
  def show_program
    init_topic
    init_tour
    @first_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: '1')
    @second_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: '2')
    @third_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: '3')
    @fourth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: '4')
    @fifth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: '5')
  end
  
  def show_professors
    @subject = Subject.find(params[:id])
    @professors = @subject.professors.order(surname: :asc, name: :asc)
  end
  
  def show_events
    @subject = Subject.find(params[:id])
    @events = @subject.events.order(datetime: :asc)
  end
  
  def show_courses
    @subject = Subject.find(params[:id])
    @courses = @subject.courses.order(school_year_id: :asc, name: :asc)
  end
  
  def init_topic
    @subject = Subject.find(params[:id])
  end
  
  def init_from_page
    @from_event_id = params[:from_event]
    @from_event = Event.find(@from_event_id) if @from_event_id
    
    @from_professor_id = params[:from_professor]
    @from_professor = Professor.find(@from_professor_id) if @from_professor_id
    
    @from_course_id = params[:from_course]
    @from_course = Course.find(@from_course_id) if @from_course_id
  end
  
  def init_tour
    @tour_year_id = params[:from_year]
    if(@tour_year_id)
      @subjects = Subject.joins(:plans).where(plans: {school_year_id: @tour_year_id}).order(name: :asc)
      @index = @subjects.index(@subject)
      set_index_tour(@index,@subjects)
      @next_show = @next
      @prev_show = @prev
    end
  end
end
