class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order(surname: :asc, name: :asc)
  end

  def show
    init_topic
    init_from_page
  end
  
  def show_meetings
    @professor = Professor.find(params[:id])
    @meetings = @professor.meetings.order(datetime: :asc)
  end
  
  def new
    @professor = Professor.new
    @subjects = Subject.order(name: :asc)
  end
  
  def create
    image = params[:professor][:img_url]
    File.open(Rails.root.join('public','professors', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end if image
    params[:professor][:img_url] = image.original_filename if image
    params[:professor][:subject_ids].delete("")
    subject_ids = params[:professor][:subject_ids]
    subjects = Subject.find(subject_ids)
    params[:professor].delete(:subject_ids)
    professor = Professor.create(professor_params)
    if professor.errors.any?
      redirect_to error_editorial_path(errors: professor.errors.messages)
    else
      professor.subjects << subjects
      redirect_to editorials_path
    end
  end
  
  def init_topic
    @professor = Professor.find(params[:id])
    @subjects = @professor.subjects
  end
  
  def init_from_page
    @from_subject_id = params[:from_subject]
    @from_subject = Subject.find(@from_subject_id) if @from_subject_id
    
    @from_meeting_id = params[:from_meeting]
    @from_meeting = Meeting.find(@from_meeting_id) if @from_meeting_id
  end
  
  private
  def professor_params
    params.require(:professor).permit(:name, :surname, :email, :telephone, :img_url)
  end
end
