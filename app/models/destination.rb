class Destination < ApplicationRecord
  # Direct associations

  has_many   :recommendations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
