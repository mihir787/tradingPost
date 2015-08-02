class Item < ActiveRecord::Base

  belongs_to :user
  has_many :trades
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :title, presence: true
  validates :description, presence: true

  enum status: %w(active retired)

end
