# test/test_property.rb
require 'minitest/autorun'
require './property'

class TestProperty < Minitest::Test
  def test_addition
    property = Property.new
    property.add("Studio", "Chicago", 1200)  # Pass strings and an integer

    # Check if the property details are correct
    assert_equal "Studio, Chicago, 1200", property.details, "Search failed"
  end
end
