require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has many categories' do
    category = Category.create(title: "furniture")
    item = category.items.create(title: "couch", description: "blue sectional")
    expect(item.category.title).to eq("furniture")
  end

  it 'belongs to a user' do
    user = User.create(name: "michelle", email: "m4@example.com", password: "password")
    user.items.create(title: "laptop", description: "macbook pro")
    expect(user.items.length).to be(1)
  end

  it 'has many proposed_trades' do
    item = Item.create(title: "watch", description: "gold")
    item.trades.create
    expect(item.trades.length).to be(1)
  end

  it {should validate_presence_of :title}
  it {should validate_presence_of :description}

end
