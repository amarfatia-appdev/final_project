class User < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :recommendations,
             :dependent => :destroy

  # Indirect associations

  has_many   :liked_places,
             :through => :favorites,
             :source => :destination

  # Validations
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
