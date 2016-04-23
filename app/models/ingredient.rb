class Ingredient < ActiveRecord::Base
  belongs_to :step
  before_save :strip_amount

  private
  def strip_amount
    # Spaces are used later to parse amounts for calculation;
    # be sure no extra spaces are saved.
    self.amount = self.amount.strip
  end
end
