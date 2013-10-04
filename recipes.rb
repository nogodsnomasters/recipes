require_relative "recipe.rb"


puts "welcome to the recipe database"

recipes = []

puts "what would you like to do?"

loop do
  puts "type 'list' show recipes"
  puts "type 'add' to add a recipe"
  puts "type 'remove' to remove a recipe"
  puts "type 'update' to update a recipe"
  puts "type 'exit' to exit"
  
  choice = gets.chomp

  case choice
  when "list"
    puts recipes
  when "add"
    recipes << Recipe.get_recipe
 
  when "remove"
    puts "which recipe would you like to remove" 
  
    recipes.each_with_index do |item, index| 
      puts "#{item} #{index}"
      end 
    
      remove = gets.chomp
      i = remove.to_i
  
      recipes.delete_at(i)
      puts "#{i} has been removed from database"
      
  when "update"
    
  when "exit"
    break
  else 
      puts "try again"
  end 
end


recipes.each_with_index do |item, index| 
  puts "#{item} #{index}"
  end


