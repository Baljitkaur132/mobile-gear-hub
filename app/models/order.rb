class Order < ApplicationRecord
  belongs_to :province
  has_many :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["address", "city", "created_at", "email", "gst_amount", "hst_amount",
     "id", "postal_code", "province_id", "pst_amount", "status",
     "subtotal", "total", "updated_at", "user_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "province"]
  end
end
