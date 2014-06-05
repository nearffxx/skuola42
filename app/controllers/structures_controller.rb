class StructuresController < ApplicationController
  def index
    @structures = Structure.all
  end

  def show
    init_topic
  end
  
  def show_events
    @structure = Structure.find(params[:id])
    @events = @structure.events.order(datetime: :asc)
  end
  
  def init_topic
    @structure = Structure.find(params[:id])
  end
  
end
