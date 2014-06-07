class CoursesController < ApplicationController
  def index
    @first_year_courses = Course.where(school_year_id: '1').order(name: :asc)
    @second_year_courses = Course.where(school_year_id: '2').order(name: :asc)
    @third_year_courses = Course.where(school_year_id: '3').order(name: :asc)
    @fourth_year_courses = Course.where(school_year_id: '4').order(name: :asc)
    @fifth_year_courses = Course.where(school_year_id: '5').order(name: :asc)
  end

  def show
    init_topic
    init_from_page
  end
  
  def show_materials
    init_topic
  end
  
  def init_topic
    @course = Course.find(params[:id])
    @subjects = @course.subjects
    @schedules = @course.schedules.order(school_day_id: :asc)
  end
  
  def init_from_page
    @from_subject_id = params[:from_subject]
    @from_subject = Subject.find(@from_subject_id) if @from_subject_id
  end
end
