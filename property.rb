class Apartment
  attr_accessor :type, :location, :price

  def initialize(type = nil, location = nil, price = nil)
    @type = type
    @location = location
    @price = price
    @apartments = [] # Instance variable to store apartments for each Apartment object
  end

  def to_s
    "Apartment type: #{@type}, Location: #{@location}, Price: #{@price}"
  end

  def apartment_list(type, location, price)
    if type && location && price
      apartment = Apartment.new(type, location, price)
      @apartments.push(apartment)
      puts "#{apartment.to_s} has been listed."
    else
      puts "Invalid apartment details. Listing failed."
    end
  end

  def apartment_search(type, location, price)
    apartment = @apartments.find do |apt|
      apt.type == type && apt.location == location && apt.price == price
    end

    if apartment
      @apartments.delete(apartment)
      puts "#{apartment.to_s} has been found and removed."
    else
      puts "No matching apartment found."
    end
  end

  def options
    if @apartments.empty?
      puts "No apartments are available at this time."
    else
      @apartments.each do |apartment|
        puts apartment.to_s
      end
    end
  end
end
