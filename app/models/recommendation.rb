class Recommendation < ApplicationRecord
  # Direct associations

  belongs_to :destination

  belongs_to :user

  # Indirect associations

  # Validations

end
