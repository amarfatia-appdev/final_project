class Destination < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :tags,
             :dependent => :destroy

  has_many   :flights,
             :dependent => :destroy

  has_many   :hotels,
             :dependent => :destroy

  has_many   :recommendations,
             :dependent => :destroy

  # Indirect associations

  has_many   :vibes,
             :through => :tags,
             :source => :vibe

  has_many   :fans,
             :through => :favorites,
             :source => :user

  # Validations

end
