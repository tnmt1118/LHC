class Shopping < ApplicationRecord  
    belongs_to :user, optional: true
    belongs_to :recipe, optional: true
    validates :buy, presence: true
end
