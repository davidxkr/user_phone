class User < ActiveRecord::Base
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, :address
end
