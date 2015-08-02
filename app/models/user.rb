class User < ActiveRecord::Base

  has_secure_password

  has_many :trades
  has_many :items

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

end
