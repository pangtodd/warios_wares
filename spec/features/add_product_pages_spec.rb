require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Enter new product'
    fill_in 'Name', :with => 'mango blasters'
    fill_in 'Price', :with => '10.99'
    select "Italy", :from =>"product[country_of_origin]"
    click_on 'Create Product'
    click_on "All products"
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Mango Blasters'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end