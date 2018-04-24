class Api::V1::ArmorsController < Api::V1::BaseController

   before_action :set_armor, only: [ :update, :destroy ]

  def index
    @armors = Armor.all
    render json: @armors
  end

  def create
    @armor = Armor.new(armor_params)
    if @armor.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    if @armor.update(armor_params)
      render :index
    else
      render_error
    end
  end

  def destroy
    @armor.destroy
    head :no_content
  end

  private

  def set_armor
    @armor = armor.find(params[:id])
  end

  def armor_params
    permitted = params.require(:armor).permit(:name, :attack_points, :durability, :price)
  end

  def render_error
    render json: { errors: @armor.errors.full_messages },
      status: :unprocessable_entity
  end
end
