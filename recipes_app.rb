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
  
  def get_ingredients
    ingredients = []
    loop do
      puts "please add an ingredient or type 'done' to finish"
      ingredient = gets.chomp
      
      if ingredient != "done"

       puts "how much do you use"
        quantity = gets.chomp

        begin
          ingredients << IngredientItem.new(ingredient, quantity)
        rescue StandardError => error
          puts error.message
        end
      else 
        break  
      end 
    end
    
   ingredients.to_s
  end
  
  def get_recipe

    puts "Please enter the title of your recipe:"
    title = gets.chomp

    puts "Please describe this recipe:"
    description = gets.chomp
    
    Recipe.new(title, description, get_ingredients)
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
        @recipes << get_recipe
        
        
      when "remove"
        puts "which recipe would you like to remove" 
  
        list
    
        remove = gets.chomp
        selection = remove.to_i
  
        @recipes.delete_at(selection - 1)
        puts "#{selection} has been removed from database"
      
      when "update"
        puts "which recipe would you like to update?"
        
        list
        
        selection = gets.chomp.to_i
        
        recipe = @recipes[selection - 1]
        puts "the old title is #{recipe.title}. enter a new title or leave blank to keep current title."
        
        input = gets.chomp
        
        recipe.title = input if !input.empty? # ! here means "not" or "if input is not empty"
        
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
  end
end
