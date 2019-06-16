class Product < ApplicationRecord

  has_many :order_items

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  mount_uploader :image1, ProductImageUploader
  mount_uploader :image2, ProductImageUploader
  mount_uploader :image3, ProductImageUploader
  mount_uploader :image4, ProductImageUploader
  mount_uploader :image5, ProductImageUploader

  def price_in_pounds
    price / 100
  end

end
