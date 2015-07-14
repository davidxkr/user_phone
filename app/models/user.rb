class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :phones
  has_one :address

  delegate :line1, :zip, to: :address, prefix: true, allow_nil: true
  accepts_nested_attributes_for :phones, :address
end
