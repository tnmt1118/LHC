class Block < ApplicationRecord
    belongs_to :user, optional: true
end
