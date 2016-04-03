class Recipe < ActiveRecord::Base
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :steps, dependent: :destroy
  has_many :ingredients, through: :steps

  accepts_nested_attributes_for :steps, reject_if: :reject_steps, allow_destroy: true

  def reject_steps(attributes)
    attributes['description'].blank?
  end

end
