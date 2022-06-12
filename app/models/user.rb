class User < ApplicationRecord
    has_secure_password validations: false

    validates :name, presence: true, length: {maximum: 8 }
    validates :password, length: {minimum: 4, maximum: 10}

    has_many :posts

end