class SiteSetting < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.get(key)
    find_by(key: key)&.value
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "key", "updated_at", "value" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
