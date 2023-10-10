class User < ApplicationRecord
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true
    validates :email, length: { maximum: 255 }
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :email, uniqueness: { case_sensitive: false }

    validates :password, presence: true
    validates :password, length: { minimum: 8 }
    has_secure_password

    validates :name, presence: true
end