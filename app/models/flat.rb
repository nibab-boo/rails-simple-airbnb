class Flat < ApplicationRecord
  validates :name, :price_per_night, :number_of_guests, :address, :description, presence: true
  validates :price_per_night, :number_of_guests, numericality: {
    only_integer: true
  }
end
