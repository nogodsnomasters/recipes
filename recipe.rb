require_relative "ingredient_item.rb"

class Recipe 
  attr_accessor :title, :description
  
  def initialize(title = "untitled", description = nil, ingredients = [])
    @title = title
    @description = description 
    @ingredients = ingredients 
  end
  
  def to_s 
    [@title, @description, @ingredients].compact * "\n"
  end 
  
  def one_line
    "#{@title}: #{@description}"
    [@title, @description].compact * ": "
  end
   
    
end
