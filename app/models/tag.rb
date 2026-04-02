class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags
  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
