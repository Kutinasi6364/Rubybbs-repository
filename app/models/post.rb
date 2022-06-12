class Post < ApplicationRecord
  has_secure_password validations: false

  validates :content, presence: true, length: {maximum: 200}
  
  belongs_to :user

end
