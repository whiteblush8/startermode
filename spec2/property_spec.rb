# spec2/property_spec.rb

require_relative '../property'  # Ensure this path is correct

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
      @apartment.apartment_search(@apartment.type, @apartment.location, @apartment.price)

      expect(@apartment.instance_variable_get(:@apartments).size).to eq(0)
    end

    it "does not remove any apartment if not found" do
      @apartment.type = "1B"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Search for a non-existing apartment (should not be removed)
      @apartment.apartment_search("2B", "Chicago", "$1500")

      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#options" do
    it "lists all available apartments" do
      @apartment.type = "studio"
      @apartment.location = "New York"
      @apartment.price = "$1200"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Verify the correct output when listing apartments
      expect { @apartment.options }.to output("Apartment type: studio, Location: New York, Price: $1200\
