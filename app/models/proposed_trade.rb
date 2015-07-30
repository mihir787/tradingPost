class ProposedTrade < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  enum status: %w(pending accepted denied)
end
