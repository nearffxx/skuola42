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
  
  def show_practical_info
    init_topic
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
end
