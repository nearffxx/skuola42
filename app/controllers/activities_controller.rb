class ActivitiesController < ApplicationController
  include ApplicationHelper
  
  def index
    @activities = Activity.all
  end
  
  def show
    init_topic
    init_from_page
    init_tour
  end
  
  def show_modality
    init_topic
    init_tour
  end
  
  def new
    @activity = Activity.new
    @professors = Professor.order(surname: :asc)
  end
  
  def create
    image = params[:activity][:img_url]
    File.open(Rails.root.join('public','activities', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end if image
    params[:activity][:img_url] = image.original_filename if image
    activity = Activity.create(activity_params)
    if activity.errors.any?
      redirect_to error_editorial_path(errors: activity.errors.messages)
    else
      redirect_to editorials_path
    end
  end
  
  def init_topic
    @activity = Activity.find(params[:id])
    @professor = @activity.professor
  end
  
  def init_from_page
    @from_professor_id = params[:from_professor]
    @from_professor = Professor.find(@from_professor_id) if @from_professor_id 
  end
  
  def init_tour
    @from_guided_tour = params[:from_guided_tour]
    @activities = Activity.all
    @index = @activities.index(@activity)
    set_index_tour(@index,@activities)
    @next_show = @next && @from_guided_tour
    @prev_show = @prev && @from_guided_tour
  end
  
  private
  def activity_params
    params.require(:activity).permit(:name, :professor_id, :description, :modality, :img_url)
  end
end
