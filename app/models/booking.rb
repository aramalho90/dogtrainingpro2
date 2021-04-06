class Booking < ApplicationRecord
  belongs_to :dog

  validates :dog, :presence => true
  validates :start_date,  presence: true
  validates :end_date,  presence: true
  validates :price,  presence: true




end
