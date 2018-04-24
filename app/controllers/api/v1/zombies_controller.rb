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

  def create
    @zombie = Zombie.new(zombie_params)
    if @zombie.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_zombie
    @zombie = Zombie.find(params[:id])
  end

  def zombie_params
    permitted = params.require(:zombie).permit(:name, :hit_points, :brains_eaten, :speed, :turn_date)
  end
end
