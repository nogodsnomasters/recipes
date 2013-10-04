class Recipe 
  def initialize(title, description)
    @title = title
    @description = description 
  end
  
  def to_s 
    "#{@title}\n#{@description}" 
  end 
  
  def one_line
    "#{@title}: #{@description}"
  end
   
  def self.get_recipe
    puts "Please title your recipe:"
    title = gets.chomp

    puts "Please describe this recipe:"
    description = gets.chomp
  
    Recipe.new(title, description)
  end  
end
