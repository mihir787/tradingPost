require 'rails_helper'

RSpec.describe ProposedTrade, type: :model do
  it 'belongs to a user' do
    user = User.create(name: "michelle", email: "mlg@example.com", password: "password")
    user.proposed_trades.create
    expect(user.proposed_trades.length).to be(1)
  end

  it 'belongs to an item' do
    item = Item.create(title: "umbrella", description: "rainbow")
    item.proposed_trades.create
    expect(item.proposed_trades.length).to be(1)
  end
end
