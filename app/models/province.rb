class Province < ApplicationRecord
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :gst, numericality: { greater_than_or_equal_to: 0 }
  validates :pst, numericality: { greater_than_or_equal_to: 0 }
  validates :hst, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "gst", "hst", "id", "name", "pst", "updated_at"]
  end
end
