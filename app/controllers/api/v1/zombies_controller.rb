class Api::V1::ZombiesController < Api::V1::BaseController

   before_action :set_zombie, only: [ :show, :update, :destroy, :add_armor, :add_weapon, :remove_armor, :remove_weapon ]

   #show all zombies. Can filter by any atribute, armor or weapon, for search an specific zombie
  def index
    @zombies = Zombie.where(nil) # creates an anonymous scope
    @zombies = @zombies.starts_with(params[:starts_with]) if params[:starts_with].present?
    @zombies = @zombies.speed(params[:speed]) if params[:speed].present?
    @zombies = @zombies.hit_points(params[:hit_points]) if params[:hit_points].present?
    @zombies = @zombies.brains_eaten(params[:brains_eaten]) if params[:brains_eaten].present?
    @zombies = @zombies.weapons(params[:weapons].split(',')) if params[:weapons].present?
    @zombies = @zombies.armors(params[:armors].split(',')) if params[:armors].present?
  end

  #show a zombie with its atributes, weapons and armors
  def show
    @weapon = @zombie.weapons
    @armor = @zombie.armors
    render json: { zombie: @zombie, zombie_weapons: @weapon, zombie_armors: @armor}
  end

  #crete a new zombie with one random armor and weapon
  def create
    @zombie = Zombie.new(zombie_params)
    @zombie.armors << Armor.all.sample
    @zombie.weapons << Weapon.all.sample
    if
      @zombie.save
      render :show, status: :created
    else
      render_error
    end
  end

  #update an existing zombie
  def update
    if @zombie.update(zombie_params)
      render :show
    else
      render_error
    end
  end

  #destroy a specific zombie
  def destroy
    @zombie.destroy
    head :no_content
  end

  #Methods for add and remove armors and weapons to the zombie
  def add_weapon
    @zombie.weapons << Weapon.all.sample
    if
      @zombie.save
      render :show
    else
      render_error
    end
  end

  def add_armor
    @zombie.armors << Armor.all.sample
    if
      @zombie.save
      render :show
    else
      render_error
    end
  end

  def remove_armor
    @armor = @zombie.armors.sample
    unless @armor.blank?
      @zombie_armor = ZombieArmor.where(zombie_id: @zombie.id, armor_id: @armor.id).sample
      @zombie_armor.delete
    end
    if
      @zombie.save
      render :show
    else
      render_error
    end
  end

  def remove_weapon
    @weapon = @zombie.weapons.sample
    unless @weapon.blank?
      @zombie_weapon = ZombieWeapon.where(zombie_id: @zombie.id, weapon_id: @weapon.id).sample
      @zombie_weapon.delete
    end
    if
      @zombie.save
      render :show
    else
      render_error
    end
  end

  private

  def set_zombie
    @zombie = Zombie.find(params[:id])
  end

  def zombie_params
    permitted = params.require(:zombie).permit(:name, :hit_points, :brains_eaten, :speed, :turn_date )
  end

  def render_error
    render json: { errors: @zombie.errors.full_messages },
      status: :unprocessable_entity
  end
end
