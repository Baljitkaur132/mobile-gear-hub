class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_one_attached :image
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id",
     "is_new", "is_on_sale", "name", "price", "stock_quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "tags"]
  end
end
