require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price}
  it { should validate_presence_of :country_of_origin}

  it("titleizes the name of a product")do
  product = Product.create({name:"biggie mushrooms", price: 13.55, country_of_origin: "Italy"})
  expect(product.name()).to(eq("Biggie Mushrooms"))
end
end