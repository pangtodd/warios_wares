Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.unique.ingredient,
                    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                    country_of_origin: Faker::Address.unique.country,)
  5.times do |index|
    Review.create!(author: Faker::DcComics.name,
                    content_body: Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false),
                    rating: Faker::Number.between(from: 1, to: 5),
                    product_id: product.id)
  end
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
