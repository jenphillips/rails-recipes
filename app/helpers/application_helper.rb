module ApplicationHelper

  def consolidate_ingredients(recipes)
    # Takes an array of recipes (can contain just one recipe)
    # Consolidates multiple entries for ingredients with same name into one row

    # XXX For now assume just one recipe
    recipe = recipes[0]
    consolidated_ingredients = {}
    recipe.ingredients.each do |ing|
      if !consolidated_ingredients.key?(ing.name)
        # Add new entry
        consolidated_ingredients[ing.name] = {}
        consolidated_ingredients[ing.name]["amount"] = amount_to_rational(ing.amount)
        consolidated_ingredients[ing.name]["unit"] = ing.unit
      else
        # Add this amount to existing ingredient entry
        consolidated_ingredients[ing.name]["amount"] += amount_to_rational(ing.amount)
      end
    end

    consolidated_ingredients
  end

  private
  def amount_to_rational(amt)
    # Convert string amount from database into rational to use in calculations.
    # Leading/trailing whitespace has been stripped prior to saving.
    #
    # Amount may take any of these forms:
    #
    # "1"     - whole number, no spaces or slashes
    # "1/2"   - fraction, no spaces, one slash
    # "1 2/3" - mixed number, one or more digits in whole number, one space, one slash

    if !amt.include?(" ")
      if !amt.include?("/")
        # Whole number
        return Rational(amt.to_i)
      else
        # Fraction
        fraction_to_rational(amt)
      end
    else
      # Mixed number
      whole_num = amt.split(" ")[0].to_i
      fraction = fraction_to_rational(amt.split(" ")[1])
      return whole_num + fraction
    end
  end

  def fraction_to_rational(fraction)
    # Convert a fraction string (e.g. "1/2") to a rational
    numerator = fraction.split("/")[0]
    denominator = fraction.split("/")[1]
    return Rational(numerator, denominator)
  end

  def rational_to_mixed(rat)
    # Convert a rational to a mixed number for display (e.g. "3/2" -> "1 1/2")
    int = rat.to_i
    if (int != rat.to_f) && (int > 0)
      fraction = rat - int
      "#{int} #{fraction}"
    else
      if rat.denominator == 1
        # Whole number; truncate denominator
        rat.to_i.to_s
      else
        # Fraction
        rat.to_s
      end
    end
  end

end
