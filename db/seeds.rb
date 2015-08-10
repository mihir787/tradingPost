class Seed

  def call
    generate_users
    puts "generated users"
    generate_categories
    puts "generated categories"
    generate_items
    puts "generated items"
    generate_proposed_trades
    puts "generated proposed items"
  end

  def self.call
    new.call
  end

  private

  def generate_users
    User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password")
    User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", password: "password")
    User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", password: "password")
    User.create(name: "Kyle Henson", email: "kashisme@msn.com", password: "password")
    User.create(name: "Mihir Parikh", email: "mihir787@gmail.com", password: "password")
    User.create(name: "Michelle Golle", email: "michelle@gmail.com", password: "password")
  end

  def generate_categories
      Category.create!(title: "Furniture", image: "furniture.jpg")
      Category.create!(title: "Tickets", image: "tickets.jpg")
      Category.create!(title: "Computers", image: "computers.jpg")
      Category.create!(title: "Sporting Equipment", image: "sports.jpg")
      Category.create!(title: "Books", image: "books.jpg")
      Category.create!(title: "Electronics/Hardware", image: "electronics.jpg")
      Category.create!(title: "Clothes", image: "clothes.jpg")
      Category.create!(title: "Housing", image: "housing.jpg")
      Category.create!(title: "Kitchen", image: "kitchen.jpg")
      Category.create!(title: "Computer Accessories", image: "comp-accessories.jpg")
      Category.create!(title: "Parking", image: "parking.jpg")
  end

  def generate_items
    User.all.each do |user|
      user.items.create(title: "2012 Macbook Pro Charger", description: "Lightly used", desired_trade_items:"free", category_id: 10)
      user.items.create(title: "Wireless Mouse", description: "Never used", desired_trade_items:"computer chair", picture: File.open("#{Rails.root}/app/assets/images/mouse.jpg"), category_id: 10)
      user.items.create(title: "Apartment for sublet in Lodo", description: "1 bed 1 bath, 700sq feet.", desired_trade_items:"money, cars, rims, and bling", category_id: 8, picture: File.open("#{Rails.root}/app/assets/images/apt1.jpg"))
      user.items.create(title: "Cap Hill Apartment", description: "1 bed 1 bath, 700sq feet.", desired_trade_items:"money, cars, rims, and bling", category_id: 8, picture: File.open("#{Rails.root}/app/assets/images/apt2.jpg"))
      user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling", picture: File.open("#{Rails.root}/app/assets/images/tennis_racket.jpg"), category_id: 4)
      user.items.create(title: "MacBook Pro", description: "2 years old", desired_trade_items:"money", picture: File.open("#{Rails.root}/app/assets/images/macbook_pro.jpg"), category_id: 3)
      user.items.create(title: "Ty Lawson Jersey", description: "Lightly used", desired_trade_items:"dog sitting", picture: File.open("#{Rails.root}/app/assets/images/lawson.jpeg"), category_id: 7)
      user.items.create(title: "Toaster", description: "Lightly used", desired_trade_items:"money", picture: File.open("#{Rails.root}/app/assets/images/toaster.jpeg"), category_id: 9)
      user.items.create(title: "Parking Spot 17th and Blake", description: "Close to school", desired_trade_items:"money", category_id: 11)
      user.items.create(title: "Queen mattress", description: "Only used for 7 months", desired_trade_items:"Iphone 5", picture: File.open("#{Rails.root}/app/assets/images/mattress.jpg"), category_id: 1)
      user.items.create(title: "Bakeware", description: "Lightly used", desired_trade_items:"house sitting", picture: File.open("#{Rails.root}/app/assets/images/bakeware.jpg"), category_id: 9)
      user.items.create(title: "Leather Couch", description: "Lightly used", desired_trade_items:"Bike", picture: File.open("#{Rails.root}/app/assets/images/couch.jpg"), category_id: 1)
      user.items.create(title: "Standing Lamp", description: "3 settings, 4 feet tall", desired_trade_items:"none, free", picture: File.open("#{Rails.root}/app/assets/images/lamp.jpg"), category_id: 1)
      user.items.create(title: "T Swift Tickets", description: "You know you want them", desired_trade_items:"roller skates", category_id: 2)
      user.items.create(title: "Mountain Bike", description: "1 year old", desired_trade_items:"couch or loveseat", picture: File.open("#{Rails.root}/app/assets/images/bike.jpg"), category_id: 4)
      user.items.create(title: "Northface Jacket", description: "Heavy winter coat lightly used", desired_trade_items:"Rockies tickets", picture: File.open("#{Rails.root}/app/assets/images/coat.jpg"), category_id: 7)
      user.items.create(title: "Books", description: "Misc ruby, rails, javascript books", desired_trade_items:"dog sitting", category_id: 5)
      user.items.create(title: "Blender", description: "2 year old Ninja", desired_trade_items:"money", picture: File.open("#{Rails.root}/app/assets/images/blender.jpeg"), category_id: 9)
      user.items.create(title: "Nightstand", description: "3'x1.5'x 3'", desired_trade_items:"cookies", picture: File.open("#{Rails.root}/app/assets/images/nightstand.jpg"), category_id: 1)
    end
  end

  def generate_proposed_trades
    Trade.create(status: 0, item_id: 1, user_id: 2, message: "Samsung 6500 Series TV")
    Trade.create(status: 1, item_id: 2, user_id: 3, message: "Samsung 6500 Series TV")
    Trade.create(status: 2, item_id: 3, user_id: 4, message: "Samsung 6500 Series TV")
    Trade.create(status: 0, item_id: 4, user_id: 5, message: "Samsung 6500 Series TV")
    Trade.create(status: 1, item_id: 5, user_id: 2, message: "Samsung 6500 Series TV")

    Trade.create(status: 0, item_id: 6, user_id: 1, message: "Samsung 6500 Series TV")
    Trade.create(status: 1, item_id: 7, user_id: 3, message: "Samsung 6500 Series TV")
    Trade.create(status: 2, item_id: 8, user_id: 4, message: "Samsung 6500 Series TV")
    Trade.create(status: 0, item_id: 9, user_id: 5, message: "Samsung 6500 Series TV")
    Trade.create(status: 1, item_id: 10, user_id: 1, message: "Samsung 6500 Series TV")

    Trade.create(status: 0, item_id: 11, user_id: 1, message: "I gotta chzburger")
    Trade.create(status: 1, item_id: 12, user_id: 2, message: "I gotta chzburger")
    Trade.create(status: 2, item_id: 13, user_id: 4, message: "I gotta chzburger")
    Trade.create(status: 0, item_id: 14, user_id: 5, message: "I gotta chzburger")
    Trade.create(status: 1, item_id: 15, user_id: 1, message: "I gotta chzburger")

    Trade.create(status: 0, item_id: 16, user_id: 1, message: "I gotta chzburger")
    Trade.create(status: 1, item_id: 17, user_id: 2, message: "I gotta chzburger")
    Trade.create(status: 2, item_id: 18, user_id: 3, message: "I gotta chzburger")
    Trade.create(status: 0, item_id: 19, user_id: 5, message: "I gotta chzburger")
    Trade.create(status: 1, item_id: 20, user_id: 1, message: "I gotta chzburger")

    Trade.create(status: 0, item_id: 21, user_id: 1, message: "Swap with my table and 3 chairs")
    Trade.create(status: 1, item_id: 22, user_id: 2, message: "Swap with my table and 3 chairs")
    Trade.create(status: 2, item_id: 23, user_id: 3, message: "Swap with my table and 3 chairs")
    Trade.create(status: 0, item_id: 24, user_id: 4, message: "Swap with my table and 3 chairs")
    Trade.create(status: 1, item_id: 25, user_id: 1, message: "Swap with my table and 3 chairs")

    Trade.create(status: 0, item_id: 26, user_id: 1, message: "Swap with my table and 3 chairs")
    Trade.create(status: 1, item_id: 27, user_id: 2, message: "Swap with my table and 3 chairs")
    Trade.create(status: 2, item_id: 28, user_id: 3, message: "Swap with my table and 3 chairs")
    Trade.create(status: 0, item_id: 29, user_id: 4, message: "Swap with my table and 3 chairs")
    Trade.create(status: 1, item_id: 30, user_id: 1, message: "Swap with my table and 3 chairs")

    Trade.create(status: 0, item_id: 31, user_id: 1, message: "I'll trade you my iphone 5")
    Trade.create(status: 1, item_id: 32, user_id: 2, message: "I'll trade you my iphone 5")
    Trade.create(status: 2, item_id: 33, user_id: 3, message: "I'll trade you my iphone 5")
    Trade.create(status: 0, item_id: 34, user_id: 4, message: "I'll trade you my iphone 5")
    Trade.create(status: 1, item_id: 35, user_id: 1, message: "I'll trade you my iphone 5")

    Trade.create(status: 0, item_id: 36, user_id: 1, message: "How about $14.32?")
    Trade.create(status: 1, item_id: 37, user_id: 2, message: "How about $14.32?")
    Trade.create(status: 2, item_id: 38, user_id: 5, message: "How about $14.32?")
    Trade.create(status: 0, item_id: 39, user_id: 4, message: "How about $14.32?")
    Trade.create(status: 1, item_id: 40, user_id: 6, message: "How about $14.32?")

    Trade.create(status: 0, item_id: 50, user_id: 1, message: "I'll trade you my iphone 5")
    Trade.create(status: 1, item_id: 51, user_id: 5, message: "I'll trade you my iphone 5")
    Trade.create(status: 2, item_id: 52, user_id: 3, message: "I'll trade you my iphone 5")
    Trade.create(status: 0, item_id: 53, user_id: 6, message: "I'll trade you my iphone 5")
    Trade.create(status: 1, item_id: 54, user_id: 1, message: "I'll trade you my iphone 5")

    Trade.create(status: 0, item_id: 55, user_id: 6, message: "How about $14.32?")
    Trade.create(status: 1, item_id: 56, user_id: 5, message: "How about $14.32?")
    Trade.create(status: 2, item_id: 57, user_id: 3, message: "How about $14.32?")
    Trade.create(status: 0, item_id: 58, user_id: 4, message: "How about $14.32?")
    Trade.create(status: 1, item_id: 59, user_id: 1, message: "How about $14.32?")
  end

end

Seed.call
