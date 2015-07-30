require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has many items' do
    category = Category.create(title: "furniture")
    category.items.create(title: "couch")
    expect(category.items.length).to be(1)
  end

  it {should validate_presence_of :title}
end
