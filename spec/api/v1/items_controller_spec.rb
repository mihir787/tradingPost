require 'rails_helper'

RSpec.describe "Api::V1::UsersController" do
  it 'can create an item' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")

    item_params = { title: "sample item", description: "super cool item", desired_trade_items: "money, cash, and rims", user_id: user.id }

    post '/api/v1/items', format: :json, item: item_params

    expect(Item.count).to be(1)
    expect(Item.first.title).to eq("sample item")
  end

  it 'can show an item' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")

    item = Item.create(title: "some title", description: "something", desired_trade_items: "money, cash, and rims", user_id: user.id )

    get "/api/v1/items/#{item.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "some title"
  end

  it 'can show all items' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling")
    user.items.create(title: "MacBook Pro", description: "2 years old", desired_trade_items:"money")
    user.items.create(title: "Ty Lawson Jersey", description: "Lightly used", desired_trade_items:"dog sitting")
    user.items.create(title: "Toaster", description: "Lightly used", desired_trade_items:"money")
    user.items.create(title: "Parking Spot 17th and Blake", description: "Close to school", desired_trade_items:"money")

    get "/api/v1/items", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.first["title"]).to eq "Tennis Racket"
    expect(body.last["title"]).to eq "Parking Spot 17th and Blake"

  end

  it 'can update an item' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    item = Item.create(title: "some title", description: "something", desired_trade_items: "money, cash, and rims", user_id: user.id )

    get "/api/v1/items/#{item.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "some title"

    item_params = {title: "new title", description: "new desc", desired_trade_items: "new items", user_id: user.id}

    put "/api/v1/items/#{item.id}", format: :json, item: item_params

    expect(response.status).to eq 204
    expect(Item.first.title).to eq "new title"
  end

  it 'can delete an item' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    item = Item.create(title: "some title", description: "something", desired_trade_items: "money, cash, and rims", user_id: user.id )
    delete "/api/v1/items/#{item.id}", format: :json

    expect(response.status).to eq 204
    expect(response.body).to eq ""
  end
end
