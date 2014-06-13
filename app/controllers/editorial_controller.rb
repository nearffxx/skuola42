class EditorialController < ApplicationController
  def index
  end
  
  def error
    @errors = params[:errors]
  end
end
