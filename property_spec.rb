# spec/property_spec.rb
require_relative '../property'  # Require the property file to test

RSpec.describe Apartment do
  # This test checks if an Apartment object can be created successfully.
  describe '#initialize' do
    it 'creates an apartment with the correct type, location, and price' do
      apartment = Apartment.new('Studio', 'Downtown', '1500')
      
      expect(apartment.type).to eq('Studio')
      expect(apartment.location).to eq('Downtown')
      expect(apartment.price).to eq('1500')
    end
  end

  # This test checks the to_s method for formatting the apartment details
  describe '#to_s' do
    it 'returns a string representation of the apartment' do
      apartment = Apartment.new('1 Bedroom', 'Uptown', '1200')
      expect(apartment.to_s).to eq('Apartment type: 1 Bedroom, Location: Uptown, Price: 1200')
    end
  end

  # This test checks the listing functionality.
  describe '#apartment_list' do
    it 'adds an apartment to the list' do
      apartment = Apartment.new('2 Bedroom', 'Midtown', '2000')
      apartment.send(:apartment_list, '2 Bedroom', 'Midtown', '2000')  # Using send to call private method
      
      expect(apartment.instance_variable_get(:@apartments).length).to eq(1)
    end
  end
  
  # Test to check if apartment search works as expected
  describe '#apartment_search' do
    it 'removes the searched apartment from the list' do
      apartment = Apartment.new('3 Bedroom', 'Suburb', '2500')
      apartment.send(:apartment_list, '3 Bedroom', 'Suburb', '2500')
      apartment.send(:apartment_search, '3 Bedroom', 'Suburb', '2500')
      
      expect(apartment.instance_variable_get(:@apartments).length).to eq(0)
    end
  end
end
