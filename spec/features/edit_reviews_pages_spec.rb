require 'rails_helper'

describe "add a review to a product" do
  before(:each)do
    visit new_product_path
    fill_in 'Name', :with => 'slim jims'
    fill_in 'Price', :with => 2.69
    select "United States of America", :from =>"product[country_of_origin]"
    click_on 'Create Product'
    click_on "All products"
    click_on('Slim Jims', match: :first)
    click_on "Add a review"
    fill_in "Author", :with=> "Skinny Pete"
    fill_in "Content body", :with=> "I dunno, I'd like them to to be a little less slim. I'd consider buying a Thick Jim."
    fill_in "Rating", :with=> 3
    click_on "Create Review"
  end

  it "edits a review" do
    visit products_path
    click_on "All products"
    click_on('Slim Jims', match: :first)
    click_on '3 stars, review by Skinny Pete'
    click_on 'Edit review'
    fill_in "Author", :with=> "Just Pete"
    fill_in "Content body", :with=> "I just realized what I said and I'd like to take it back. Slim Jims are just fine. Please delete."
    fill_in "Rating", :with=> 4
    click_on 'Update Review'
    expect(page).to have_content '4 stars, review by Just Pete'
    expect(page).to have_content 'Review successfully updated!'
  end

  it "returns an error if a field is blank." do
    visit products_path
    click_on "All products"
    click_on('Slim Jims', match: :first)
    click_on '3 stars, review by Skinny Pete'
    click_on 'Edit review'
    fill_in "Author", :with=> ""
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "is able to delete a review." do
    visit products_path
    click_on "All products"
    click_on('Slim Jims', match: :first)
    click_on '3 stars, review by Skinny Pete'
    click_on 'Delete review'
    expect(page).to_not have_content "3 stars, review by Skinny Pete"
  end

end