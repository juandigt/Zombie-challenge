class Armor < ApplicationRecord
  has_many :zombie_armors, dependent: :destroy
  has_many :zombies, through: :zombie_armors

  # Armor must have a name and it must be unique
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
