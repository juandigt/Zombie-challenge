class Weapon < ApplicationRecord
  has_many :zombie_weapons, dependent: :destroy
  has_many :zombies, through: :zombie_weapons


  # Weapon must have a name and it must be unique
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
