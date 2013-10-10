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
      puts "type 'show' to show a full recipe"
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
        puts "which recipe would you like to update?"
        
        list
        
        selection = gets.chomp.to_i
        
        recipe = @recipes[selection - 1]
        puts "the old title is #{recipe.title}. enter a new title or leave blank to keep current title."
        
        input = gets.chomp
        
        recipe.title = input if !input.empty?
        
        puts "the old description is #{recipe.description}. enter a new description or leave blank to keep current description."
        
        input = gets.chomp
        
        recipe.description = input if !input.empty?
      
      when "show"
        puts "which recipe would you like to show"
        
        list
        
        selection = gets.chomp.to_i
        
        recipe = @recipes[selection - 1]
        
        puts recipe
         
      when "exit"
        break
      else 
        puts "try again"
      end 
    end

    list
  end
end
