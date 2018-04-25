class Weapon < ApplicationRecord
  has_many :zombie_weapons, dependent: :destroy
  has_many :zombies, through: :zombie_weapons


  # Weapon must have a name
  validates :name, presence: true
end
