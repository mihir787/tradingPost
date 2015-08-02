require 'rails_helper'

RSpec.describe "Api::V1::UsersController" do
  it 'can create an item' do
    item_params = { title: "sample item", description: "super cool item" }

    post '/api/v1/items', format: :json, item: item_params

    expect(Item.count).to be(1)
  end

  it 'can show an item' do
    item = Item.create(title: "some title", description: "something")

    get "/api/v1/items/#{item.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "some title"
  end

  it 'can update an item' do
    item = Item.create(title: "title", description: "desc")

    get "/api/v1/items/#{item.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "title"

    item_params = {title: "new title", description: "desc"}

    put "/api/v1/users/#{item.id}", format: :json, item: item_params

    expect(response.status).to eq 204
    expect(Item.first.title).to eq "new title"
  end
end
