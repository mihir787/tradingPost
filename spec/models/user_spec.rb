require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many proposed_trades' do
    user = User.create(name: "michelle", email: "m@example.com", password: "password")
    user.trades.create
    expect(user.trades.length).to be(1)
  end

  it 'has many items' do
    user = User.create(name: "michelle", email: "mg@example.com", password: "password")
    user.items.create(title: "lamp")
    expect(user.items.length).to be(1)
  end

  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it {should validate_presence_of :password}

end
