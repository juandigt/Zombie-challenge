require 'rails_helper'

RSpec.describe Api::V1::ZombiesController, type: :controller do


  let(:valid_attributes) {
    FactoryBot.attributes_for(:zombie)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:zombie, name: nil)
  }

  describe 'GET #index' do
    it 'returns a success response' do
      zombie = Zombie.create! valid_attributes
      get :index, params: {}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      zombie = Zombie.create! valid_attributes
      get :show, params: {id: zombie.to_param}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Zombie' do
        expect {
          post :create, params: {zombie: valid_attributes}
        }.to change(Zombie, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new zombie' do

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

      it 'updates the requested zombie' do
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
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the zombie' do
        zombie = Zombie.create! valid_attributes

        put :update, params: {id: zombie.to_param, zombie: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested zombie' do
      zombie = Zombie.create! valid_attributes
      expect {
        delete :destroy, params: {id: zombie.to_param}
      }.to change(Zombie, :count).by(-1)
    end
  end
end
