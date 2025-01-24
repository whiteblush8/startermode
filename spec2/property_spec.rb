# tests/test_calculator.rb

require 'minitest/autorun'
require './property'

class TestProperty < Minitest::Test
  def test_property_creation
    property = Property.new(type: "Apartment", location: "New York", price: 1200)
    assert_equal "Apartment", property.type
    assert_equal "New York", property.location
    assert_equal 1200, property.price
  end

  def test_search_by_type
    property1 = Property.new(type: "Apartment", location: "New York", price: 1200)
    property2 = Property.new(type: "House", location: "Los Angeles", price: 2500)
    properties = [property1, property2]

    results = Property.search(properties, type: "Apartment")
    assert_equal 1, results.length
    assert_equal "Apartment", results.first.type
  end
end
