class Recipe < ApplicationRecord
    has_many :favorites
    has_many :shoppings
    validates :recipeId, uniqueness: true
end
