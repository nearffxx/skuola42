module ApplicationHelper
    def year_id(year)
      case year
      when :first
        SchoolYear.find_by_year('1').id
      when :second
        SchoolYear.find_by_year('2').id
      when :third
        SchoolYear.find_by_year('3').id
      when :fourth
        SchoolYear.find_by_year('4').id
      when :fifth
        SchoolYear.find_by_year('5').id
      end
    end
end
