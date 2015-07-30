class User < ActiveRecord::Base

  has_secure_password

  has_many :proposed_trades
  has_many :items

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

end
