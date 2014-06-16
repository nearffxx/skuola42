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

  def full_title(title)
    skuola42 = "Skuola42"
    if(title.empty?)
      skuola42
    else
      "#{skuola42} | #{title}"
    end
  end
end
