# spec/apartment_spec.rb

require_relative '../property'  # Adjust the path if necessary

RSpec.describe Apartment do
  before(:each) do
    # Set up the instance before each test
    @apartment = Apartment.new
  end

  describe "#to_s" do
    it "returns a string with apartment details" do
      @apartment.type = "studio"
      @apartment.location = "new york city"
      @apartment.price = "$1200"

      expect(@apartment.to_s).to eq("Apartment type: studio, Location: new york city, Price: $1200")
    end
  end

  describe "#apartment_list" do
    it "adds an apartment to the list" do
      @apartment.log
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#apartment_search" do
    it "removes an apartment from the list when found" do
      @apartment.log
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      @apartment.apartment_search(@apartment.type, @apartment.location, @apartment.price)

      expect(@apartment.instance_variable_get(:@apartments).size).to eq(0)
    end

    it "does not remove any apartment if not found" do
      @apartment.log
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      # Search for an apartment that doesn't exist
      @apartment.apartment_search("2B", "los angeles", "$1500")

      expect(@apartment.instance_variable_get(:@apartments).size).to eq(1)
    end
  end

  describe "#options" do
    it "lists all available apartments" do
      @apartment.log
      @apartment.apartment_list(@apartment.type, @apartment.location, @apartment.price)

      expect { @apartment.options }.to output("Apartment type: #{@apartment.type}, Location: #{@apartment.location}, Price: #{@apartment.price}\n").to_stdout
    end

    it "outputs 'No apartments are available at this time.' if no apartments are listed" do
      expect { @apartment.options }.to output("No apartments are available at this time.\n").to_stdout
    end
  end
end
