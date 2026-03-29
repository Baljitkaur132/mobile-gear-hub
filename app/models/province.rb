class Province < ApplicationRecord
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "gst", "hst", "id", "name", "pst", "updated_at"]
  end
end
