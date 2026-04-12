class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true
  has_many :orders

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "city", "created_at", "email", "id", "name", "postal_code", "province_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "province", "orders" ]
  end
end
