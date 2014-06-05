class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order(surname: :asc, name: :asc)
  end

  def show
    init_topic
    init_from_page
  end
  
  def init_topic
    @professor = Professor.find(params[:id])
    @subjects = @professor.subjects
  end
  
  def init_from_page
    @from_subject_id = params[:from_subject]
    @from_subject = Subject.find(@from_subject_id) if @from_subject_id
  end
end
