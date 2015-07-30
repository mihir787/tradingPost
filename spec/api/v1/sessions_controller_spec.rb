require 'rails_helper'

RSpec.describe "Api::V1::SessionsController" do
  it 'can login' do
    user = User.create(:name => "kyle", :email => "kyle787@gmail.com", :password => "password", :password_confirmation => "password")

    user_params = {:email => "kyle787@gmail.com", :password => "password", :password_confirmation => "password"}

    post '/api/v1/sessions', format: :json, user: user_params
    expect(response.status).to be(201)
  end

  # it 'can show a user' do
  #   user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
  #
  #   get "/api/v1/users/#{user.id}", format: :json
  #
  #   body = JSON.parse(response.body)
  #   expect(response.status).to eq 200
  #   expect(body["name"]).to eq "mihir"
  # end
  #
  # it 'can update a user' do
  #   user = User.create(:name => "mihir", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password")
  #
  #   get "/api/v1/users/#{user.id}", format: :json
  #
  #   body = JSON.parse(response.body)
  #   expect(response.status).to eq 200
  #   expect(body["name"]).to eq "mihir"
  #
  #   user_params = {:name => "mihir p", :email => "mihir787@gmail.com", :password => "password", :password_confirmation => "password"}
  #
  #   put "/api/v1/users/#{user.id}", format: :json, user: user_params
  #
  #   expect(response.status).to eq 204
  #   expect(User.first.name).to eq "mihir p"
  # end
end
