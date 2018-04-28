class Zombie < ApplicationRecord
  include Filterable
  has_many :zombie_weapons, dependent: :destroy
  has_many :zombie_armors, dependent: :destroy

  has_many :weapons, through: :zombie_weapons
  has_many :armors, through: :zombie_armors

  # Zombie must have a name
  validates :name, presence: true

  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  scope :speed, -> (speed) { where speed: speed }
  scope :brains_eaten, -> (brains_eaten) { where brains_eaten: brains_eaten }
  scope :hit_points, -> (hit_points) { where hit_points: hit_points }
  scope :weapons, -> (weapons) {joins(:zombie_weapons).where("zombie_weapons.weapon_id IN (?)", weapons)}
  scope :armors, -> (armors) {joins(:zombie_armors).where("zombie_armors.armor_id IN (?)", armors)}

end
