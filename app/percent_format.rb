class PercentFormat
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
        first_name, city, birthdate = v.split(" % ")
        arr << [first_name, city, format_date(birthdate)]
      end
    end
    arr
  end

  private

  attr_reader :params

  def format_date(birthdate)
    yy, mm, dd = birthdate.split('-')
    "#{mm.to_i}/#{dd.to_i}/#{yy}"
  end
end