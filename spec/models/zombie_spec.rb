require 'rails_helper'

RSpec.describe Zombie, type: :model do
  it { should have_many(:zombie_armors).dependent(:destroy) }
  it { should have_many(:zombie_weapons).dependent(:destroy) }
end
