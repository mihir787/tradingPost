class User < ActiveRecord::Base

  has_attached_file :picture, default_url: "default_image.jpg"
  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_secure_password

  has_many :trades
  has_many :items

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

end
