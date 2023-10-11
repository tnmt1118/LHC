class Shopping < ApplicationRecord
    belongs_to :user, optional: true
end
