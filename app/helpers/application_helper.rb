module ApplicationHelper
  def set_index_tour(start_index, objects)
    @index = start_index
    
    if(@index > 0)
      @prev = @index - 1
    end
    if(objects[@index + 1])
      @next = @index + 1
    end
  end
end
