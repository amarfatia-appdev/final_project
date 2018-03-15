class Flight < ApplicationRecord
  # Direct associations

  belongs_to :destination

  # Indirect associations

  # Validations
  
  validates :destination_id, presence: true, uniqueness: true
  validates :min_cost, presence: true, numericality: { only_integer: true }

end
