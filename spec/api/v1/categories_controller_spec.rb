require 'rails_helper'

RSpec.describe "Api::V1::CategoriesController" do
  it 'can create a category' do
    category_params = {:title => "Bikes"}

    post '/api/v1/categories', format: :json, category: category_params

    expect(Category.count).to be(1)
  end

  it 'can can return all the categories' do
    category1 = Category.create(:title => "Bikes")
    category2 = Category.create(:title => "TV")
    categories = [category1, category2]

    get "/api/v1/categories", format: :json, category: categories

    expect(Category.count).to be(2)
  end

  it 'can show a category' do
    category = Category.create(:title => "Bikes")

    get "/api/v1/categories/#{category.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "Bikes"
  end

  it 'can delete a category' do
    category = Category.create(:title => "Art")

    get "/api/v1/categories/#{category.id}", format: :json

    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["title"]).to eq "Art"
    expect(Category.count).to be(1)

    Category.first.delete

    expect(Category.count).to be(0)
  end
end
