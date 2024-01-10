class Recipe < ApplicationRecord
    has_many :favorites
    validates :recipeId, uniqueness: true
end
