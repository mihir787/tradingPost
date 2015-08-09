class Item < ActiveRecord::Base
  has_attached_file :picture, default_url: "default_image.jpg"
  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :user
  belongs_to :category
  has_many :trades

  validates :title, presence: true
  validates :description, presence: true

  enum status: %w(active retired)
end
