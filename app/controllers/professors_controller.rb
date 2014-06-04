class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order(surname: :asc, name: :asc)
  end

  def show
    @professor = Professor.find(params[:id])
    @subjects = @professor.subjects
    @id_from_subject = params[:from_subject]
    @subject = Subject.find(@id_from_subject ) if @id_from_subject
  end
end
