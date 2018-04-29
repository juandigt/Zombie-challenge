require 'rails_helper'


RSpec.describe Api::V1::ZombiesController, type: :controller do


  let(:valid_attributes) {
    FactoryBot.attributes_for(:zombie)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:zombie, name: nil)
  }

  describe 'GET #index' do
    it 'returns a success response', :show_in_doc do
      zombie = Zombie.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response', :show_in_doc do
      zombie = Zombie.create! valid_attributes
      get :show, params: {id: zombie.to_param}
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Zombie', :show_in_doc do
        expect {
          post :create, params: {zombie: valid_attributes}
        }.to change(Zombie, :count).by(1)
      end

      it 'renders a JSON response with the new zombie', :show_in_doc do

        post :create, params: {zombie: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(zombie_url(Zombie.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new zombie', :show_in_doc do

        post :create, params: {zombie: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        FactoryBot.attributes_for(:zombie)
      }

      it 'updates the requested zombie', :show_in_doc do
        zombie = Zombie.create! valid_attributes
        update_attributes = new_attributes
        put :update, params: {id: zombie.to_param, zombie: update_attributes}
        zombie.reload
        expect(zombie.name).to eq(new_attributes[:name])
        expect(zombie.hit_points).to eq(new_attributes[:hit_points])
        expect(zombie.speed).to eq(new_attributes[:speed])
        expect(zombie.brains_eaten).to eq(new_attributes[:brains_eaten])
        expect(zombie.turn_date).to eq(new_attributes[:turn_date])
      end

      it 'renders a JSON response with the zombie', :show_in_doc do
        zombie = Zombie.create! valid_attributes

        put :update, params: {id: zombie.to_param, zombie: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the zombie', :show_in_doc do
        zombie = Zombie.create! valid_attributes

        put :update, params: {id: zombie.to_param, zombie: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested zombie', :show_in_doc do
      zombie = Zombie.create! valid_attributes
      expect {
        delete :destroy, params: {id: zombie.to_param}
      }.to change(Zombie, :count).by(-1)
    end
  end

  describe 'POST #add_armors' do
    it 'add specific armors to specific zombie', :show_in_doc do
      zombie = Zombie.create! valid_attributes
      armor_ids = FactoryBot.create_list(:armor, 3).pluck(:id)
      post :add_armors, params: {id: zombie.to_param, armor_ids: armor_ids}
      zombie.reload
      expect(zombie.armors.count).to eq(3)
    end
  end

  describe 'POST #add_weapons' do
    it 'add specific weapons to specific zombie', :show_in_doc do
      zombie = Zombie.create! valid_attributes
      weapon_ids = FactoryBot.create_list(:weapon, 3).pluck(:id)
      post :add_weapons, params: {id: zombie.to_param, weapon_ids: weapon_ids}
      zombie.reload
      expect(zombie.weapons.count).to eq(3)
    end
  end



end

#   describe 'GET #index' do
#     it 'returns a success response', :show_in_doc do
#       valid_attributes = (name:"Green Tinkles", hit_points: 3, brains_eaten: 2, speed: 9, turn_date:"2017-03-21T00:00:00.000Z") }
# )
#       zombie = Zombie.create! valid_attributes
#       get :index, params: {}
#       expect(response).to be_success
#     end
#   end

# RSpec.describe Api::V1::ZombiesController, type: :controller do



#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #show" do
#     it "returns http success" do
#       get :show
#       expect(response).to have_http_status(:success)
#     end
#   end

# end
