class Tag < ApplicationRecord
  # Direct associations

  belongs_to :vibe

  belongs_to :destination

  # Indirect associations

  # Validations

end
