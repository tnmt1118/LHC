class Shopping < ApplicationRecord
    belongs_to :user, optional: true
    validates :buy, presence: true
end
