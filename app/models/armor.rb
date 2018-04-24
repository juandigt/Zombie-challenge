class Armor < ApplicationRecord
  has_many :zombie_armors, dependent: :destroy
  has_many :zombies, through: :zombie_armors
end
