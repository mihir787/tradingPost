require 'rails_helper'

RSpec.describe "Api::V1::SessionsController" do
  it 'can login' do
    user = User.create(:name => "kyle", :email => "kyle787@gmail.com", :password => "password", :password_confirmation => "password")

    user_params = {:email => "kyle787@gmail.com", :password => "password"}

    post '/api/v1/sessions', format: :json, user: user_params
    expect(response.status).to be(201)
  end

  it 'can logout' do
    user = User.create(:name => "kyle", :email => "kyle787@gmail.com", :password => "password", :password_confirmation => "password")

    user_params = {:email => "kyle787@gmail.com", :password => "password"}

    post '/api/v1/sessions', format: :json, user: user_params
    expect(response.status).to be(201)


    delete "/api/v1/sessions/#{user.id}", format: :json, user: user_params
    expect(response.status).to be(204)
  end



end
