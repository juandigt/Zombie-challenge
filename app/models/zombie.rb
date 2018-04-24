class Zombie < ApplicationRecord
  has_many :zombie_weapons, dependent: :destroy
  has_many :zombie_armors, dependent: :destroy

  has_many :weapons, through: :zombie_weapons
  has_many :armors, through: :zombie_armors

   # Zombie must put a name and it must be unique
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
