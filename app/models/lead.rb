class Lead < ActiveRecord::Base
	belongs_to :user
	before_save { self.email = email.downcase }
	validates :name, :category, presence: true
	validates :phoneno, presence: true, uniqueness: true, length: { minimum: 8, maximum: 10 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    validates :user_id, presence: true
    
end