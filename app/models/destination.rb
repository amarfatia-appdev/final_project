class Destination < ApplicationRecord
  # Direct associations

  has_many   :tags,
             :dependent => :destroy

  has_many   :flights,
             :dependent => :destroy

  has_many   :hotels,
             :dependent => :destroy

  has_many   :recommendations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
