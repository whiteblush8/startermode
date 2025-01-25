require 'minitest/autorun'
require './property'

class TestApartment < Minitest::Test
  def test_apartment_to_s
    apartment = Apartment.new("Studio", "Chicago", 1200)  # Pass strings and an integer

    # Check if the apartment details are correct by calling to_s
    assert_equal "Apartment type: Studio, Location: Chicago, Price: 1200", apartment.to_s, "Apartment details mismatch"
  end
end

