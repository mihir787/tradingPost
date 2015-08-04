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
      Category.create!(title: "Furniture" )
      Category.create!(title: "Tickets")
      Category.create!(title: "Computers")
      Category.create!(title: "Sporting Equipment")
      Category.create!(title: "Books")
      Category.create!(title: "Electronics/Hardware")
      Category.create!(title: "Clothes")
      Category.create!(title: "Housing")
      Category.create!(title: "Kitchen")
      Category.create!(title: "Computer Accessories")
      Category.create!(title: "Parking")
  end

  def generate_items
    User.all.each do |user|
      user.items.create(title: "Tennis Racket", description: "Lightly used", desired_trade_items:"money, cars, rims, and bling", picture: File.open("#{Rails.root}/app/assets/images/tennis_racket.jpg")).categories << Category.find(4)
      user.items.create(title: "MacBook Pro", description: "2 years old", desired_trade_items:"money", picture: File.open("#{Rails.root}/app/assets/images/macbook_pro.jpg")).categories << Category.find(3)
      user.items.create(title: "Ty Lawson Jersey", description: "Lightly used", desired_trade_items:"dog sitting", picture: File.open("#{Rails.root}/app/assets/images/lawson.jpeg")).categories << Category.find(7)
      user.items.create(title: "Toaster", description: "Lightly used", desired_trade_items:"money", picture: File.open("#{Rails.root}/app/assets/images/toaster.jpeg")).categories << Category.find(9)
      user.items.create(title: "Parking Spot 17th and Blake", description: "Close to school", desired_trade_items:"money").categories << Category.find(11)
      user.items.create(title: "Queen mattress", description: "Only used for 7 months", desired_trade_items:"Iphone 5", picture: File.open("#{Rails.root}/app/assets/images/mattress.jpg")).categories << Category.find(1)
      user.items.create(title: "Bakeware", description: "Lightly used", desired_trade_items:"house sitting", picture: File.open("#{Rails.root}/app/assets/images/bakeware.jpg")).categories << Category.find(9)
      user.items.create(title: "Leather Couch", description: "Lightly used", desired_trade_items:"Bike", picture: File.open("#{Rails.root}/app/assets/images/couch.jpg")).categories << Category.find(1)
      user.items.create(title: "Standing Lamp", description: "3 settings, 4 feet tall", desired_trade_items:"parking space", picture: File.open("#{Rails.root}/app/assets/images/lamp.jpg")).categories << Category.find(1)
      user.items.create(title: "T Swift Tickets", description: "You know you want them", desired_trade_items:"tennis racket").categories << Category.find(2)
      user.items.create(title: "Mountain Bike", description: "1 year old", desired_trade_items:"couch or loveseat", picture: File.open("#{Rails.root}/app/assets/images/bike.jpg")).categories << Category.find(4)
      user.items.create(title: "Northface Jacket", description: "Heavy winter coat lightly used", desired_trade_items:"Rockies tickets", picture: File.open("#{Rails.root}/app/assets/images/coat.jpg")).categories << Category.find(7)
      user.items.create(title: "Books", description: "Misc ruby, rails, javascript books", desired_trade_items:"dog sitting").categories << Category.find(5)
      user.items.create(title: "Blender", description: "2 year old Ninja", desired_trade_items:"Bike", picture: File.open("#{Rails.root}/app/assets/images/blender.jpeg")).categories << Category.find(9)
      user.items.create(title: "Nightstand", description: "3'x1.5'x 3'", desired_trade_items:"couch", picture: File.open("#{Rails.root}/app/assets/images/nightstand.jpg")).categories << Category.find(1)


    end
  end

  def generate_proposed_trades
    Trade.create(status: 0, item_id: 1, user_id: 2)
    Trade.create(status: 1, item_id: 2, user_id: 3)
    Trade.create(status: 2, item_id: 3, user_id: 4)
    Trade.create(status: 0, item_id: 4, user_id: 5)
    Trade.create(status: 1, item_id: 5, user_id: 2)

    Trade.create(status: 0, item_id: 6, user_id: 1)
    Trade.create(status: 1, item_id: 7, user_id: 3)
    Trade.create(status: 2, item_id: 8, user_id: 4)
    Trade.create(status: 0, item_id: 9, user_id: 5)
    Trade.create(status: 1, item_id: 10, user_id: 1)

    Trade.create(status: 0, item_id: 11, user_id: 1)
    Trade.create(status: 1, item_id: 12, user_id: 2)
    Trade.create(status: 2, item_id: 13, user_id: 4)
    Trade.create(status: 0, item_id: 14, user_id: 5)
    Trade.create(status: 1, item_id: 15, user_id: 1)

    Trade.create(status: 0, item_id: 16, user_id: 1)
    Trade.create(status: 1, item_id: 17, user_id: 2)
    Trade.create(status: 2, item_id: 18, user_id: 3)
    Trade.create(status: 0, item_id: 19, user_id: 5)
    Trade.create(status: 1, item_id: 20, user_id: 1)

    Trade.create(status: 0, item_id: 21, user_id: 1)
    Trade.create(status: 1, item_id: 22, user_id: 2)
    Trade.create(status: 2, item_id: 23, user_id: 3)
    Trade.create(status: 0, item_id: 24, user_id: 4)
    Trade.create(status: 1, item_id: 25, user_id: 1)

    Trade.create(status: 0, item_id: 26, user_id: 1)
    Trade.create(status: 1, item_id: 27, user_id: 2)
    Trade.create(status: 2, item_id: 28, user_id: 3)
    Trade.create(status: 0, item_id: 29, user_id: 4)
    Trade.create(status: 1, item_id: 30, user_id: 1)

    Trade.create(status: 0, item_id: 31, user_id: 1)
    Trade.create(status: 1, item_id: 32, user_id: 2)
    Trade.create(status: 2, item_id: 33, user_id: 3)
    Trade.create(status: 0, item_id: 34, user_id: 4)
    Trade.create(status: 1, item_id: 35, user_id: 1)

    Trade.create(status: 0, item_id: 36, user_id: 1)
    Trade.create(status: 1, item_id: 37, user_id: 2)
    Trade.create(status: 2, item_id: 38, user_id: 5)
    Trade.create(status: 0, item_id: 39, user_id: 4)
    Trade.create(status: 1, item_id: 40, user_id: 6)

    Trade.create(status: 0, item_id: 50, user_id: 1)
    Trade.create(status: 1, item_id: 51, user_id: 5)
    Trade.create(status: 2, item_id: 52, user_id: 3)
    Trade.create(status: 0, item_id: 53, user_id: 6)
    Trade.create(status: 1, item_id: 54, user_id: 1)

    Trade.create(status: 0, item_id: 55, user_id: 6)
    Trade.create(status: 1, item_id: 56, user_id: 5)
    Trade.create(status: 2, item_id: 57, user_id: 3)
    Trade.create(status: 0, item_id: 58, user_id: 4)
    Trade.create(status: 1, item_id: 59, user_id: 1)
  end

end

Seed.call
