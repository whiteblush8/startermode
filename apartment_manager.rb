# apartment_manager.rb
class ApartmentManager
  def initialize
    @apartments = []
  end

  # Book (add) a new apartment
  def book_apartment(type:, location:, price:, available: true)
    new_apartment = Property.new(type: type, location: location, price: price, available: available)
    @apartments << new_apartment
  end

  # List all apartments (just for verifying the test)
  def list_apartments
    @apartments.map(&:to_s)
  end
end
