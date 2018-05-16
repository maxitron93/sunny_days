require "open-uri"
require "nokogiri"
require 'terminal-table'
require 'colorize'
require_relative 'color'
require_relative 'climate'
require_relative 'sunrise'

system("clear")

#Welcome Comment, requests input.
puts """
        
    Welcome to Weather Finder. With this Terminal App you can find the perfect time of year to travel to your dream destination.\n\n
                                    Information presented courtesy of www.timeanddate.com 
                                     Gems utilized: Nokogiri, Terminal-table & Colorize.
    """

try_again = true

while try_again == true

     begin

        #Prompts the user for a country
        puts "If you wish to quit, enter 'quit'.\n\n"
        puts "Please enter a Country."
        country = gets.strip.downcase.split(" ").join("-")
        if country == "quit"
            break
        end

        #Prompts the user for a city
        puts "Please enter a City."
        city = gets.strip.downcase.split(" ").join("-")
        if city == "quit"
            break
        end
        
        puts "Please wait while we collect your information."

        #Utilise methods to collect the data. Refer to climate.rb, sunrise.rb and color.rb for additional information.
        climate_array = get_climate_data(country, city)
        sunrise_array = get_sunrise_data(country, city)

        #The array that concats both climate and daylight information together
        final_array = []
        count = 0
        while count < 12
            month_array = climate_array[count].concat(sunrise_array[count])
            count += 1
            final_array.push(month_array)
        end
        
        #The table that contains the completed data
        table_title = "#{city.upcase}, #{country.upcase}"
        table_headings = ['Month',"High#{176.chr(Encoding::UTF_8)}C", "Low#{176.chr(Encoding::UTF_8)}C", "Mean#{176.chr(Encoding::UTF_8)}C", 'Rain mm', 'Humidity %', 'Wind km/h', 'Sunrise', 'Sunset', 'Day Length']
        table = Terminal::Table.new :title => table_title, :headings => table_headings, :rows => final_array

        system("clear")

        #Displays Table
        puts table
        
    rescue
        
        system("clear")
        #If error occurs, puts comment and re-instates loop.
        try_again = true
        puts "No destination found. Please try again."

    end
end