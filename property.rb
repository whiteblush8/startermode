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

class ApartmentManager
  def initialize
    @apartments = []
  end

  # Book (add) a new apartment
  def book_apartment(type:, location:, price:, available: true)
    new_apartment = Property.new(type: type, location: location, price: price, available: available)
    @apartments << new_apartment
  end

  # List all apartments (just to verify the test)
  def list_apartments
    @apartments.map(&:to_s)
  end
end
