# property.rb
class Property
  attr_reader :type, :location, :price, :available

  def initialize(type:, location:, price:, available: true)
    @type = type
    @location = location
    @price = price
    @available = available
  end

  def to_s
    availability = @available ? "Available" : "Not available"
    "Apartment type: #{@type}, Location: #{@location}, Price: #{@price}, Availability: #{availability}"
  end
end



