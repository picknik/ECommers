namespace :db do
  task pop: :environment do

    products count: 50, clean: true

  end
end

def products count: 1, clean: false

  Product.delete_all if clean

  collection = []

  count.times do |n|
    product = Product.new

    product.name  = Faker::Commerce.product_name

    product.price    = Faker::Commerce.price
    product.discount = rand(0.1..0.3).round(2)

    product.units_in_stock = rand(100..1000)
    product.units_on_order = rand(1..5)

    product.reorder_level  = rand(10..100)

    collection.push product if product.save!
  end

  Product.last(count)
end