class Product < ApplicationRecord
  scope :from_usa, -> { where(country_of_origin: "United States of America")}
  # "United States of America" is due to faker input
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end