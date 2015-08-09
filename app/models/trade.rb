class Trade < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  validates :message, presence: true

  enum status: %w(pending accepted denied)
end
