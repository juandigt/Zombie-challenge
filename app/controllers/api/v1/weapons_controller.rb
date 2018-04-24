class Api::V1::WeaponsController < Api::V1::BaseController

  before_action :set_weapon, only: [ :update, :destroy ]

  def index
    @weapons = Weapon.all
    render json: @weapons
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    if @weapon.update(weapon_params)
      render :index
    else
      render_error
    end
  end

  def destroy
    @weapon.destroy
    head :no_content
  end

  private

  def set_weapon
    @weapon = Weapon.find(params[:id])
  end

  def weapon_params
    permitted = params.require(:weapon).permit(:name, :attack_points, :durability, :price)
  end

  def render_error
    render json: { errors: @weapon.errors.full_messages },
      status: :unprocessable_entity
  end
end
