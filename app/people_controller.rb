require_relative "dollar_format"
require_relative "percent_format"

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    parsed_data = []
    parsed_data += DollarFormat.new(params[:dollar_format]).extract_data()
    parsed_data += PercentFormat.new(params[:percent_format]).extract_data()
    format(sort_by_name(parsed_data))
  end

  private

  attr_reader :params

  def sort_by_name(values)
    values.sort_by{|data| data[0]}
  end

  def format(values)
    values.map{|data| data.join(", ")}
  end
end
