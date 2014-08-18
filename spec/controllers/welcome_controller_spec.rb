require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'routing' do
    it 'routes / to #index' do
      expect(get: '/').to route_to(controller: 'welcome', action: 'index')
    end
  end

  describe 'GET index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
