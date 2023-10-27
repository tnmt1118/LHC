class Block < ApplicationRecord
    belongs_to :user, optional: true
    validates :block, presence: true
end
