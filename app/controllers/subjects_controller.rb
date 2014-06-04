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
    @subject = Subject.find(params[:id])
    init_tour
  end
  
  def show_program
    @subject = Subject.find(params[:id])
    @first_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:first))
    @second_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:second))
    @third_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:third))
    @fourth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:fourth))
    @fifth_year_plan = Plan.find_by(subject_id: @subject.id, school_year_id: year_id(:fifth))
    init_tour
  end
  
  def show_professors
    @subject = Subject.find(params[:id])
    @professors = @subject.professors.order(surname: :asc, name: :asc)
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
