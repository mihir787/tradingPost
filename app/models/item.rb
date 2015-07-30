class Item < ActiveRecord::Base

  belongs_to :user
  has_many :proposed_trades
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :title, presence: true
  validates :description, presence: true

end
