require "open-uri"
require "nokogiri"
require 'colorize'
#Nokogiri calling and parsing the url for sunrise/sunset information
def get_sunrise_data(country,city)
    complete_data = []
    month_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    month_array.each do |num|
        document = open("https://www.timeanddate.com/sun/#{country}/#{city}?month=#{num}&year=2018")
        content = document.read
        parsed_content = Nokogiri::HTML(content)
        month_input = []

        #Variables that represent each data point collected
        sunrise = parsed_content.at_xpath('//td[@class="c sep"]').text.split[0].to_s
        sunrise_unit = parsed_content.at_xpath('//td[@class="c sep"]').text.split[1].to_s
        sunset= parsed_content.at_xpath('//td[@class="sep c"]').text.split[0].to_s
        sunset_unit = parsed_content.at_xpath('//td[@class="sep c"]').text.split[1].to_s
        day_length = parsed_content.at_xpath('//td[@class="c tr sep-l"]').text.split[0]
        cut = day_length.split(":")
        hours = cut[0].to_i
        minutes = cut[1].to_i

        #Array of complete sunrise/sunset information for one month
        month_input = [ "#{sunrise.colorize(:yellow)}#{sunrise_unit}", "#{sunset.to_s.colorize(:magenta)}#{sunset_unit}", "#{hours}hrs:#{minutes}mins"]
        complete_data.push(month_input)
    end
    return complete_data
end