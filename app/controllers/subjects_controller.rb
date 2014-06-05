class SubjectsController < ApplicationController
  include ApplicationHelper
  
  def index
    @first_year_id = year_id(:first)
    @second_year_id = year_id(:second)
    @third_year_id = year_id(:third)
    @fourth_year_id = year_id(:fourth)
    @fifth_year_id = year_id(:fifth)
    @first_year_subjects = Subject.joins(:plans).where(plans: {school_year_id: @first_year_id }).order(name: :asc)
    @second_year_subjects = Subject.joins(:plans).where(plans: {school_year_id: @second_year_id }).order(name: :asc)
    @third_year_subjects = Subject.joins(:plans).where(plans: {school_year_id: @third_year_id }).order(name: :asc)
    @fourth_year_subjects = Subject.joins(:plans).where(plans: {school_year_id: @fourth_year_id }).order(name: :asc)
    @fifth_year_subjects = Subject.joins(:plans).where(plans: {school_year_id: @fifth_year_id }).order(name: :asc)
  end

  def show
    init_topic
    init_from_page
    init_tour
  end
  
  def show_program
    init_topic
    init_tour
    @first_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:first))
    @second_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:second))
    @third_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:third))
    @fourth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:fourth))
    @fifth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:fifth))
  end
  
  def show_professors
    @subject = Subject.find(params[:id])
    @professors = @subject.professors.order(surname: :asc, name: :asc)
  end
  
  def show_events
    @subject = Subject.find(params[:id])
    @events = @subject.events.order(datetime: :asc)
  end
  
  def init_topic
    @subject = Subject.find(params[:id])
  end
  
  def init_from_page
    @from_event_id = params[:from_event]
    @from_event = Event.find(@from_event_id) if @from_event_id
    
    @from_professor_id = params[:from_professor]
    @from_professor = Professor.find(@from_professor_id) if @from_professor_id
  end
  
  def init_tour
    @tour_year_id = params[:from_year]
    if(@tour_year_id)
      @year = SchoolYear.find(@tour_year_id).year
      @subjects = Subject.joins(:plans).where(plans: {school_year_id: @tour_year_id}).order(name: :asc)
      @index = @subjects.index(@subject)

      if(@index > 0)
        @prev = @index - 1
      end
      if(@subjects[@index + 1])
        @next = @index + 1
      end
    end
  end
end
