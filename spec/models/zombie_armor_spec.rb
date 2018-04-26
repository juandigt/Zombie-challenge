require 'rails_helper'

RSpec.describe ZombieArmor, :type => :model do
  describe "Associations" do
    it "belongs to a zombie" do
      assc = described_class.reflect_on_association(:zombie)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to an armor" do
      assc = described_class.reflect_on_association(:armor)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
