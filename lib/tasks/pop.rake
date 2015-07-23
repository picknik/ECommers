namespace :db do
  task pop: :environment do

    #products count: 50,   clean: true
    categories count: 20, clean: true

  end
end

def categories count: 1, clean: true

  Category.delete_all if clean

  categories = %w(
                   notebooks androids mouses keyboards screens
                   pads keys software hardware video audio card
                   linux books cameras printers music strings
                   phones tv chargers lamps peripheries glasses
                   hardware guitars cabs strings subwoofers
                )

  if count > categories.count
    raise ArgumentError("#{count} is greater than categories count[#{categories.count}]")
  end

  categories[0, count - 1].each do |category_name|
    category = Category.new
    category.name = category_name
    category.description = Faker::Lorem.paragraph(rand(5..10))
    category.save!
  end
end

def products count: 1, clean: false

  Product.delete_all if clean

  count.times do |n|
    product = Product.new

    product.name  = Faker::Commerce.product_name

    product.price    = Faker::Commerce.price
    product.discount = rand(0.1..0.3).round(2)

    product.units_in_stock = rand(100..1000)
    product.units_on_order = rand(1..5)

    product.reorder_level  = rand(10..100)

    product.save!
  end

  Product.last(count)
end