require_relative "apartment"

class Duplex
  def initiliaze  
    @apartments = []
  end

  def open
      puts "Welcome to the apartment!"


      loop do
        if @properties.empty?
          puts 'The apartment is unavailable. Want to type "book" to look for another place or type exit to leave?'
        else 
          puts 'Type "book", "search", or "list" to use the apartment or type exit to leave'
        end

        job = gets.chomp

        case job

        when "book"
            log()
            apartment_list(@type, @location, @price)


        when "search"
            log()
            apartment_search(@type, @location, @price)


        when "list"
            options()

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
      apartment = @apartments.find { |apartment| apartment.to_s }

     @apartments.delete(apartment)

    puts "#{apartment.to_s} has been searched."

    end

    def log()
      puts "enter type"
      @type = gets.chomp
      @location = gets.chomp
      puts "enter location"
      @price = gets.chomp
      puts "enter price"

    end


    def options()
      if @apartments.empty?
        "No apartments are available at this time."

      else 
        @apartments.each do |apartment|
          puts apartment.to_s

        end
      end
    end
  end
