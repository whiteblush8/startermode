# spec/property_spec.rb
require_relative '../property'  # Import property.rb so we can test it

RSpec.describe Apartment do
  # Test for the initialize method (creating an Apartment object)
  describe '#initialize' do
    it 'creates an apartment with type, location, and price' do
      apartment = Apartment.new('Studio', 'Downtown', '1500')
      expect(apartment.type).to eq('Studio')
      expect(apartment.location).to eq('Downtown')
      expect(apartment.price).to eq('1500')
    end
  end

  # Test for the to_s method (string representation of the apartment)
  describe '#to_s' do
    it 'returns a readable string of apartment details' do
      apartment = Apartment.new('1 Bedroom', 'Uptown', '1200')
      expect(apartment.to_s).to eq('Apartment type: 1 Bedroom, Location: Uptown, Price: 1200')
    end
  end
end
