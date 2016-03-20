module ApplicationHelper

  def consolidate_ingredients(recipes)
    # Takes an array of recipes (can contain just one recipe)
    # Consolidates multiple entries for ingredients with same name into one row
    # TODO: Actually calculate total amount required; for now just concatenates
    # the different measurements.

    # XXX For now assume just one recipe
    recipe = recipes[0]
    consolidated_ingredients = {}
    recipe.ingredients.each do |ing|
      if !consolidated_ingredients.key?(ing.name)
        # Add new entry
        consolidated_ingredients[ing.name] = "#{ing.amount.to_s} #{ing.unit}"
      else
        # Add this amount to existing ingredient entry
        consolidated_ingredients[ing.name] = "#{consolidated_ingredients[ing.name]} plus #{ing.amount.to_s} #{ing.unit}"
      end
    end

    consolidated_ingredients
  end

end
