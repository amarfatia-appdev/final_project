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
  
  validates :name, presence: true, uniqueness: {:scope => [:latitude, :longitude]}
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validates :description, presence: true
  validates :image_url, presence: true

end
