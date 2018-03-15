class Hotel < ApplicationRecord
  # Direct associations

  belongs_to :destination

  # Indirect associations

  # Validations
  
  validates :destination_id, presence: true, uniqueness: {:scope => [:stars]}
  validates :min_cost, presence: true, numericality: { only_integer: true }
  validates :stars, presence: true

end
