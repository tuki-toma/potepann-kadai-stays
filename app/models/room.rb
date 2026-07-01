class Room < ApplicationRecord
  belongs_to :user
  belongs_to :area
  
  has_many_attached :images

  validates :name, presence: true
  validates :introduce, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to:1 }
  validates :address, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address","area_id","introduce","name",]
  end

  def self.ransackable_associations(auth_object = nil)
    ["area","user"]
  end
end
