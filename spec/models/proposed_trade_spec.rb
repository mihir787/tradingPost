require 'rails_helper'

RSpec.describe Trade, type: :model do
  it 'belongs to a user' do
    user = User.create(name: "michelle", email: "mlg@example.com", password: "password")
    user.trades.create
    expect(user.trades.length).to be(1)
  end

  it 'belongs to an item' do
    item = Item.create(title: "umbrella", description: "rainbow")
    item.trades.create
    expect(item.trades.length).to be(1)
  end
end
