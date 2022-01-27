class DollarFormat
  CITY_NAMES = {"LA" => "Los Angeles", "NYC" => "New York City"}.freeze

  def initialize(params)
    @params = params
  end

  def extract_data
    values = params.split("\n")
    values.shift
    format_data(values)
  end

  def format_data(values)
    arr = [].tap do |arr|
      values.each do |v|
        city, birthdate, last_name, first_name = v.split(" $ ")
        arr << [first_name, map_city_name(city), format_date(birthdate)]
      end
    end
    arr
  end

  private

  attr_reader :params

  def format_date(birthdate)
    dd, mm, yy = birthdate.split('-')
    "#{mm.to_i}/#{dd.to_i}/#{yy}"
  end

  def map_city_name(city)
    CITY_NAMES[city]
  end
end