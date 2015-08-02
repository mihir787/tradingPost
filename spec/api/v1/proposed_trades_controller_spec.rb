require 'rails_helper'

RSpec.describe "Api::V1::ProposedTradesController" do
  it 'can create a trade' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling")

    trade_proposer = User.create(:name => "kyle", :email => "kyle@gmail.com", :password => "password", :password_confirmation => "password")
    proposed_trade_params = {item_id: user.items.first.id, user_id: trade_proposer.id}

    post '/api/v1/proposed_trades', format: :json, proposed_trade: proposed_trade_params

    expect(ProposedTrade.count).to be(1)
    expect(response.status).to be(201)
  end

  it 'can show a trade' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling")
    trade_proposer = User.create(:name => "kyle", :email => "kyle@gmail.com", :password => "password", :password_confirmation => "password")

    proposed_trade = ProposedTrade.create(item_id: user.items.first.id, user_id: trade_proposer.id)

    get "/api/v1/proposed_trades/#{proposed_trade.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["status"]).to eq "pending"
    expect(body["user_id"]).to eq trade_proposer.id
  end

  it 'can update a proposed trade' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling")
    trade_proposer = User.create(:name => "kyle", :email => "kyle@gmail.com", :password => "password", :password_confirmation => "password")

    proposed_trade = ProposedTrade.create(item_id: user.items.first.id, user_id: trade_proposer.id)

    updated_proposed_trade_params = {status: 1, item_id: user.items.first.id, user_id: trade_proposer.id}

    put "/api/v1/proposed_trades/#{proposed_trade.id}", format: :json, proposed_trade: updated_proposed_trade_params

    expect(ProposedTrade.first.status).to eq "accepted"

  end

  it 'can delete a proposed trade' do
    user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
    user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling")
    trade_proposer = User.create(:name => "kyle", :email => "kyle@gmail.com", :password => "password", :password_confirmation => "password")

    proposed_trade = ProposedTrade.create(item_id: user.items.first.id, user_id: trade_proposer.id)

    expect(ProposedTrade.first.status).to eq "pending"
    expect(ProposedTrade.count).to eq 1

    delete "/api/v1/proposed_trades/#{proposed_trade.id}", format: :json

    expect(ProposedTrade.count).to eq 0

  end
end
