require 'rails_helper'

RSpec.describe Zombie, :type => :model do
  subject { Zombie.new(name:"Green Tinkles", hit_points: 3, brains_eaten: 2, speed: 9, turn_date:"2017-03-21T00:00:00.000Z") }

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
    it "has many zombie_weapons" do
      assc = described_class.reflect_on_association(:zombie_weapons)
      expect(assc.macro).to eq :has_many
    end

    it "has many zombie_armors" do
      assc = described_class.reflect_on_association(:zombie_armors)
      expect(assc.macro).to eq :has_many
    end

    it "has many weapons" do
      assc = described_class.reflect_on_association(:weapons)
      expect(assc.macro).to eq :has_many
    end

    it "has many armors" do
      assc = described_class.reflect_on_association(:armors)
      expect(assc.macro).to eq :has_many
    end
  end
end
