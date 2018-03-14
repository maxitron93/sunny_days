require 'colorize'
# Method to color code temperature data
def color_temp(temp)
    if temp < 10
        background_color = "blue".to_sym
        font_color = "white".to_sym
    elsif temp >= 10 && temp < 18
        background_color = "cyan".to_sym
        font_color = "black".to_sym
    elsif temp >= 18 && temp < 25
        background_color = "green".to_sym
        font_color = "black".to_sym
    elsif temp >= 25 && temp < 32
        background_color = "light_yellow".to_sym
        font_color = "black".to_sym
    elsif temp >= 32
        background_color = "light_red".to_sym
        font_color = "black".to_sym
    end
        if temp.to_s.length == 1
            return(" #{temp}  ".colorize(color: font_color, background: background_color))
        elsif temp.to_s.length == 2
            return(" #{temp} ".colorize(color: font_color, background: background_color))
        else
            return("#{temp} ".colorize(color: font_color, background: background_color))
        end
end
