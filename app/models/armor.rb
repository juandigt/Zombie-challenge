class Armor < ApplicationRecord
  has_many :zombie_armors, dependent: :destroy
  has_many :zombies, through: :zombie_armors

  # Armor must have a name
  validates :name, presence: true
end
