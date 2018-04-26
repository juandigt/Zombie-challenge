require 'rails_helper'

RSpec.describe Armor, :type => :model do
  subject { Armor.new(name: "Bluetooth electric guitar", defense_points: 1, durability: 10, price: 12) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many zombie_armors" do
      assc = described_class.reflect_on_association(:zombie_armors)
      expect(assc.macro).to eq :has_many
    end

    it "has many zombies" do
      assc = described_class.reflect_on_association(:zombies)
      expect(assc.macro).to eq :has_many
    end
  end
end
