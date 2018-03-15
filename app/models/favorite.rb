class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :destination

  belongs_to :user

  # Indirect associations

  # Validations
  
  validates :user_id, presence: true, uniqueness: {:scope => :destination_id}
  validates :destination_id, presence: true

end
