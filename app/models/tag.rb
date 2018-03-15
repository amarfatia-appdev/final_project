class Tag < ApplicationRecord
  # Direct associations

  belongs_to :vibe

  belongs_to :destination

  # Indirect associations

  # Validations
  validates :destination_id, presence: true
  validates :vibe_id, presence: true, uniqueness: {:scope => :destination_id}

end
