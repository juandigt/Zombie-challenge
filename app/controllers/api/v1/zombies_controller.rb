class Api::V1::ZombiesController < Api::V1::BaseController
  def index
    @zombies = Zombie.all
    render json: @zombies
  end
end
