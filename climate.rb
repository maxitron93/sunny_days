require "open-uri"
require "nokogiri"
require_relative 'color'

#Nokogiri calling and parsing the url for climate information
def get_climate_data(country, city)
    document = open("https://www.timeanddate.com/weather/#{country}/#{city}/climate")
    content = document.read
    parsed_content = Nokogiri::HTML(content)
    #Array Loop to collect Climate information for each month.
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    information_all = []
    months.each do |month|
        information_for_month = []

        table_for_this_month = parsed_content.at_xpath("//div[@class='climate-month climate-month--#{month}']")

        #Variables that represent each data point collected
        high = table_for_this_month.children[1].text.split[2].to_i
        low = table_for_this_month.children[1].text.split[4].to_i
        mean = table_for_this_month.children[1].text.split[6].to_i
        percipitation = table_for_this_month.children[2].text.split[1].to_f
        humidity = table_for_this_month.children[2].text.split[3].to_i
        wind = table_for_this_month.children[3].text.split[1].to_i

        #Array of complete climate information for one month
        information_for_month = ["#{month.capitalize}", "#{color_temp(high)}", "#{color_temp(low)}", "#{color_temp(mean)}", "#{percipitation}", "#{humidity}", "#{wind}"]

        #Array of climate information for all months
        information_all.push(information_for_month)
    end
    return information_all
end