# spec2/apartment_spec.rb

require_relative '../property'  # Adjust this path if necessary

RSpec.describe Apartment do
  before(:each) do
    # Set up the instance before each test
    @apartment = Apartment.new
  end

  describe "#to_s" do
    it "returns a string with apartment details" do
      # Set some properties on the apartment
      @apartment.type = "studio"
      @apartment.location = "New York"
      @apartment.price = "$1200"

      # Check if the to_s method returns the expected output
      expect(@apartment.to_s).to eq("Apartment type: studio, Location: New York, Price: $1200")
    end
  end

  describe "#apartment_list" do
    it "adds an apartment to the list" do
      # Set up apartment data
      @apartment.type = "studio"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"

      # Call apartment_list to add the apartment
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Check if the apartment was added to the @apartments array
      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#apartment_search" do
    it "removes an apartment from the list when found" do
      # Add an apartment to the list
      @apartment.type = "1B"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Search and remove the apartment
      @apartment.apartment_search(@apartment.type, @apartment.location, @apartment.price)

      # Verify that the apartment was removed
      expect(@apartment.instance_variable_get(:@apartments).size).to eq(0)
    end

    it "does not remove any apartment if not found" do
      # Add an apartment to the list
      @apartment.type = "1B"
      @apartment.location = "Los Angeles"
      @apartment.price = "$2000"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Search for an apartment that doesn't exist
      @apartment.apartment_search("2B", "Chicago", "$1500")

      # Verify that the apartment is still in the list
      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#options" do
    it "lists all available apartments" do
      # Add an apartment to the list
      @apartment.type = "studio"
      @apartment.location = "New York"
      @apartment.price = "$1200"
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Expect the correct output to be printed when options is called
      expect { @apartment.options }.to output("Apartment type: studio, Location: New York, Price: $1200\n").to_stdout
    end

    it "outputs 'No apartments are available at this time.' if no apartments are listed" do
      # When no apartments have been added, calling options should print the "No apartments" message
      expect { @apartment.options }.to output("No apartments are available at this time.\n").to_stdout
    end
  end
end
