

class Apartment
  attr_accessor :type, :location, :price

  def initialize(type = "", location = "", price = "")
    @type = type
    @location = location
    @price = price
    @apartments = []  # List of apartments will be in each instance
  end

  def open
    puts "Welcome to the apartment!"

    loop do
      if @apartments.empty?
        puts 'The apartment is unavailable. Want to type "book" to look for another place or type "exit" to leave?'
      else 
        puts 'Type "book", "search", or "list" to use the apartment or type "exit" to leave'
      end

      job = gets.chomp

      case job
      when "book"
        log
        apartment_list(@type, @location, @price)
      when "search"
        log
        apartment_search(@type, @location, @price)
      when "list"
        options
      when "exit"
        puts "Talk to you later!"
        break
      else 
        puts "Did you type something wrong?"
      end
    end
  end

  private

  # Add an apartment to the list
  def apartment_list(type, location, price)
    apartment = Apartment.new(type, location, price)
    @apartments.push(apartment)
    puts "#{apartment.to_s} has been listed."
  end

  # Search for an apartment based on criteria and remove it if found
  def apartment_search(type, location, price)
    apartment = @apartments.find do |apartment|
      apartment.type == type && apartment.location == location && apartment.price == price
    end

    if apartment
      @apartments.delete(apartment)
      puts "#{apartment.to_s} has been searched and removed."
    else
      puts "No apartment found matching those criteria."
    end
  end

  # Log details of the apartment (type, location, price)
  def log
    puts "Enter type"
    @type = gets.chomp
    puts "Enter location"
    @location = gets.chomp
    puts "Enter price"
    @price = gets.chomp
  end

  # List all available apartments
  def options
    if @apartments.empty?
      puts "No apartments are available at this time."
    else 
      @apartments.each do |apartment|
        puts apartment.to_s
      end
    end
  end

  # Optional: Override to_s method to output apartment details in a readable way
  def to_s
    "Apartment type: #{@type}, Location: #{@location}, Price: #{@price}"
  end
end

# To run the program, create an instance of the Apartment class and call open
apartment = Apartment.new
apartment.open
