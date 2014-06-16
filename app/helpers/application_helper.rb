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
  
  def full_title(title) {
    @SKUOLA42 = "Skuola42"
  if(title.empty?)
    return @SKUOLA42
  else
    return "#{SKUOLA42} | #{title}"
end
