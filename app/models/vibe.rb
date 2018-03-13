class Vibe < ApplicationRecord
  # Direct associations

  has_many   :tags,
             :dependent => :destroy

  # Indirect associations

  has_many   :destinations,
             :through => :tags,
             :source => :destination

  # Validations

end
