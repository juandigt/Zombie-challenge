class Api::V1::ZombiesController < Api::V1::BaseController

   before_action :set_zombie, only: [ :show ]

  def index
    @zombies = Zombie.all
    render json: @zombies
  end

   def show
    @weapon = @zombie.weapons
    @armor = @zombie.armors
    render json: { zombie: @zombie, zombie_weapons: @weapon, zombie_armors: @armor}
  end

  private

  def set_zombie
    @zombie = Zombie.find(params[:id])
  end
end
