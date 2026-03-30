class Order < ApplicationRecord
  belongs_to :province
  belongs_to :user, optional: true
  has_many :order_items

  validates :user_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "city", "created_at", "email", "gst_amount", "hst_amount",
     "id", "postal_code", "province_id", "pst_amount", "status",
     "subtotal", "total", "updated_at", "user_name", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "province"]
  end
end
