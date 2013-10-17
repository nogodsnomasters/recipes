class IngredientItem
  def initialize(ingredient, quantity)
    @ingredient = ingredient
    quantity = quantity.to_i
    
    if quantity > 0 
      @quantity = quantity 
    else 
      raise RangeError.new("quantity must be greater than 0")
    end
  end
  
  def to_s 
    [@ingredient, @quantity].compact * ":"
  end 
  
  
end

