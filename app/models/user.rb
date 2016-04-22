class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true,  on: :update, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  on: :update, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :region, presence: true,  on: :update

  has_secure_password
end
