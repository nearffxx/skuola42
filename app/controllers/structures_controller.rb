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
  
  def new
    @structure = Structure.new
  end
  
  def create
    image = params[:structure][:img_url]
    File.open(Rails.root.join('public','structures', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end if image
    params[:structure][:img_url] = image.original_filename if image
    structure = Structure.create(structure_params)
    if structure.errors.any?
      redirect_to error_editorial_path(errors: structure.errors.messages)
    else
      redirect_to editorials_path
    end
  end
  
  def init_topic
    @structure = Structure.find(params[:id])
  end
  
  def init_tour
    @structures = Structure.all
    @index = @structures.index(@structure)
    set_index_tour(@index,@structures)
  end
  
  private
  def structure_params
    params.require(:structure).permit(:name, :description, :img_url)
  end
end
