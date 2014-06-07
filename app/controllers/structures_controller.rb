class StructuresController < ApplicationController
  include ApplicationHelper
  
  def index
    @structures = Structure.all
  end

  def show
    init_topic
    init_tour
  end
  
  def show_events
    @structure = Structure.find(params[:id])
    @events = @structure.events.order(datetime: :asc)
  end
  
  def init_topic
    @structure = Structure.find(params[:id])
  end
  
  def init_tour
    @structures = Structure.all
    @index = @structures.index(@structure)
    set_index_tour(@index,@structures)
  end
  
end
