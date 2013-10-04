require_relative "recipe.rb"

class RecipesApp
  def initialize 
    @recipes = []
  end
  
  def list
    @recipes.each_with_index do |recipe, index| 
      human_index = index + 1
      puts "#{human_index}. #{recipe.one_line}"
    end 
  end
  
  
  def run!
    puts "welcome to the recipe database"

    puts "what would you like to do?"

    loop do
      puts ""
      puts "type 'list' show recipes"
      puts "type 'add' to add a recipe"
      puts "type 'remove' to remove a recipe"
      puts "type 'update' to update a recipe"
      puts "type 'exit' to exit"
  
      choice = gets.chomp

      case choice
      when "list"
        list
      when "add"
        @recipes << Recipe.get_recipe
 
      when "remove"
        puts "which recipe would you like to remove" 
  
        list
    
        remove = gets.chomp
        i = remove.to_i
  
        @recipes.delete_at(i - 1)
        puts "#{i} has been removed from database"
      
      when "update"
    
      when "exit"
        break
      else 
        puts "try again"
      end 
    end

    list
  end
end
