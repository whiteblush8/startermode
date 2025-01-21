class Apartment
  attr_accessor :type, :location, :price

  def initialize(type = nil, location = nil, price = nil)
    @type = type
    @location = location
    @price = price
    @apartments = []
  end

  def to_s
    "Apartment type: #{@type}, Location: #{@location}, Price: #{@price}"
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

  def apartment_list(type, location, price)
    apartment = Apartment.new(type, location, price)
    @apartments.push(apartment)
    puts "#{apartment.to_s} has been listed."
  end

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

  def log
    puts "Enter type"
    @type = gets.chomp
    puts "Enter location"
    @location = gets.chomp
    puts "Enter price"
    @price = gets.chomp
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

# To run the program, you would call the `open` method on an instance of the Apartment class.
apartment = Apartment.new
apartment.open
