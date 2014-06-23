class EventsController < ApplicationController
  def index
    @event_types = EventType.all
  end
  
  def index_types
    @type = EventType.find(params[:id])
    @events = Event.where(event_type_id: @type.id).order(datetime: :asc)
  end
  
  def show
    init_topic
    init_from_page
  end
  
  def show_description
    init_topic
  end
  
   def new
    @event = Event.new
    @event_types = EventType.order(name: :asc)
    @subjects = Subject.order(name: :asc)
    @structures = Structure.order(name: :asc)
  end
  
  def create
    params[:event][:subject_ids].delete("")
    subject_ids = params[:event][:subject_ids]
    subjects = Subject.find(subject_ids)
    params[:event].delete(:subject_ids)
    event = Event.create(event_params)
    if event.errors.any?
      redirect_to error_editorial_path(errors: event.errors.messages)
    else
      event.subjects << subjects
      redirect_to editorials_path
    end
  end
  
  def init_topic
    @event = Event.find(params[:id])
    @type = EventType.find(@event.event_type_id)
    @host_structure = Structure.find(@event.structure_id)
    @related_subjects = @event.subjects
  end
  
  def init_from_page
    @from_host_id = params[:from_structure]
    @from_host = Structure.find(@from_host_id) if @from_host_id 
      
    @from_events_subject_id = params[:from_events_subject]
    @from_events_subject = Subject.find(@from_events_subject_id) if @from_events_subject_id
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :event_type_id, :structure_id, :description, :participations, :datetime)
  end
end
