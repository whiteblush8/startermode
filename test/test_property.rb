# test_property.rb
require 'minitest/autorun'
require './property'
require './apartment_manager'

class TestApartmentManager < Minitest::Test
  def setup
    @manager = ApartmentManager.new
  end

  def test_book_apartment
    # Add a new apartment
    @manager.book_apartment(type: "Studio", location: "Chicago", price: 1200, available: true)

    # Check if the new apartment was added correctly
    apartments = @manager.list_apartments
    expected = [
      "Apartment type: Studio, Location: Chicago, Price: 1200, Availability: Available"
    ]
    assert_equal expected, apartments
  end
end
