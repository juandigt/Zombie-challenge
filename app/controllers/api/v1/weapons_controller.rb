class Api::V1::WeaponsController < Api::V1::BaseController

   before_action :set_weapon, only: [ :show, :update, :destroy ]

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

  def update
    if @zombie.update(zombie_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @zombie.destroy
    head :no_content
  end

  private

  def set_zombie
    @zombie = Zombie.find(params[:id])
  end

  def zombie_params
    permitted = params.require(:zombie).permit(:name, :hit_points, :brains_eaten, :speed, :turn_date)
  end

  def render_error
    render json: { errors: @zombie.errors.full_messages },
      status: :unprocessable_entity
  end
end
