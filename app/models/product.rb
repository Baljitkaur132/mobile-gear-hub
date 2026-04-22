class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_one_attached :image
  has_many :product_tags
  has_many :tags, through: :product_tags

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "description", "id", "image",
     "is_new", "is_on_sale", "name", "price", "stock_quantity", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category" ]
  end
end
