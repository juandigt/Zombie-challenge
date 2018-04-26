require 'rails_helper'

RSpec.describe ZombieWeapon, :type => :model do
  describe "Associations" do
    it "belongs to a zombie" do
      assc = described_class.reflect_on_association(:zombie)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to an weapon" do
      assc = described_class.reflect_on_association(:weapon)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
