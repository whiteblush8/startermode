class Apartment
  attr_accessor :type, :location, :price

  @@apartments = [] # Class variable to store all apartments

  def initialize(type = nil, location = nil, price = nil)
    @type = type
    @location = location
    @price = price
  end

  def to_s
    "Apartment type: #{@type}, Location: #{@location}, Price: #{@price}"
  end

  def open
    puts "Welcome to the apartment!"

    loop do
      if @@apartments.empty?
        puts 'The apartment is unavailable. Type "book" to list a new apartment or "exit" to leave.'
      else
        puts 'Type "book", "search", or "list" to manage apartments or "exit" to leave.'
      end

      job = gets.chomp.downcase.strip

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
        puts "Goodbye!"
        break
      else
        puts "Invalid input. Please try again."
      end
    end
  end

  private

  def apartment_list(type, location, price)
    if type && location && price
      apartment = Apartment.new(type, location, price)
      @@apartments.push(apartment)
      puts "#{apartment.to_s} has been listed."
    else
      puts "Invalid apartment details. Listing failed."
    end
  end

  def apartment_search(type, location, price)
    apartment = @@apartments.find do |apt|
      apt.type.downcase == type.downcase &&
      apt.location.downcase == location.downcase &&
      apt.price.to_s == price.to_s
    end

    if apartment
      @@apartments.delete(apartment)
      puts "#{apartment.to_s} has been found and removed."
    else
      puts "No matching apartment found."
    end
  end

  def log
    puts "Enter type:"
    @type = gets.chomp.strip
    puts "Enter location:"
    @location = gets.chomp.strip
    puts "Enter price (numeric):"
    @price = gets.chomp.strip

    unless valid_price?(@price)
      puts "Invalid price entered. Please try again."
      @price = nil
    end
  end

  def valid_price?(price)
    price.match?(/^\d+(\.\d{1,2})?$/) # Validates numeric prices
  end

  def options
    if @@apartments.empty?
      puts "No apartments are available at this time."
    else
      @@apartments.each_with_index do |apartment, index|
        puts "#{index + 1}. #{apartment.to_s}"
      end
    end
  end
end

# To run the program:
