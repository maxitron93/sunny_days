# Context
This terminal app was my first programming project, built with Ruby to work in the terminal. The app was over three days in partnership with Steven Christenson. This App allows users to enter a Country and City the want to visit, and returns the monthly climate information for the area. Users can use this app to identify the best time of year to go to their holiday destination.

# Sunny Days
## Installation
1. Clone the files to your desired directory
2. Open Terminal
3. Within Terminal, go to the directory where your files will be saved.
4. Within Terminal type "bundle install" to install all gems required.
5. Within Terminal to run the program, type "ruby main.rb".

## Problem (conceptual)

People have dream travel destinations, but it can be difficult to find the best time of the year to go. 


## Solution  (conceptual)

This travel weather app enables vacationers to easily bring up the yearly weather patterns of any city in the world. They can use this information to determine the time of the year that suits them, based on their climate preferences.


## Solution  (technical)

### Gems used

[nokogiri](https://rubygems.org/gems/nokogiri): Nokogiri is an HTML, XML, SAX, and Reader parser. Among Nokogiri's many features is the ability to search documents via XPath or CSS3 selectors.

[colorize](https://rubygems.org/gems/colorize): Extends the String class or add a ColorizedString with methods to set text colour, background colour and text effects. 

[terminal-table](https://rubygems.org/gems/terminal-table): Simple, feature rich ascii table generation library that enables the creation of tables within the terminal. 

### Program logic
1.	Prompts the user to enter a country and city, or ‘quit’ to exit the program.
2.	If country or city is not found, prompts the user with “no destination found” and reinitiates the loop.
3.	If country and city is found, utilises nokogiri methods to scrape climate and astronomical information from www.timeanddate.com
4.	Arranges the collected information into arrays.
5.	Utilises terminal-table to display information within arrays in a table format.
6.	Utilises colorize to colour code temperature, sunrise and sunset information.
7.	Loop enables the user to input another country and city. Loop continues until user enters ‘quit’ when prompted to enter a country or city.

## Approach
1.	Find a web scraping gem. Found Nokogiri.
2.	Attempted to use Nokogiri methods and syntax to parse a webpage and scrape any information from it
3.	After some success, attempted to scrape targeted information using additional Nokogiri methods
4.	Used loops in conjunction with nokogiri methods to methodically collect target information for every month
5.	Arranged collected information into arrays
6.	Used terminal-table gem to display collected information
7.	Used colorize to colour code information
8.	Looked for a way to handle errors, for when the user input differed from required input. Found the begin-rescue-end method
9.	Refactored code and rearranged data-scraping code into methods. Also added comments to the body of the app.