# spec2/property_spec.rb

require_relative '../property'  # Adjust this path if necessary

RSpec.describe Apartment do
  before(:each) do
    # Set up the instance before each test
    @apartment = Apartment.new
  end

  describe "#to_s" do
    it "returns a string with apartment details" do
      @apartment.type = "studio"
      @apartment.location = "New York"
      @apartment.price = "$1200"

      expect(@apartment.to_s).to eq("Apartment type: studio, Location: New York, Price: $1200")
    end
  end

  describe "#apartment_list" do
    it "adds an apartment to the list" do
      @apartment.type = "studio"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"

      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Verify the apartment was added to the @apartments list
      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#apartment_search" do
    it "removes an apartment from the list when found" do
      @apartment.type = "1B"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Search for and remove the apartment
      @apartment.apartment_search(@apartmen
