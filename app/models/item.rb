class Item < ActiveRecord::Base
  has_attached_file :picture, default_url: "default_image.jpg"
  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :user
  has_many :trades
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :title, presence: true
  validates :description, presence: true

  enum status: %w(active retired)

end
