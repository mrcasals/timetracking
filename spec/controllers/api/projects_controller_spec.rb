require 'rails_helper'

describe Api::ProjectsController do
  let(:project) { create(:project) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, format: :json
      expect(response).to render_template :index
    end

    it 'sets the correct @projects variable' do
      get :index, format: :json
      expect(assigns :projects).to eq [project]
    end

    it 'returns a JSON' do
      get :index, format: :json
      body = JSON.parse(response.body)
      expect(body['projects']).not_to be_empty
    end
  end
end
