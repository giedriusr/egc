require 'rails_helper'

RSpec.describe GadgetsController, type: :controller do
  describe 'routing' do
    it 'routes /gadgets to #index' do
      expect(get: '/gadgets')
      .to route_to(controller: 'gadgets', action: 'index')
    end

    it 'routes /gadgets/new to #new' do
      expect(get: '/gadgets/new')
      .to route_to(controller: 'gadgets', action: 'new')
    end

    it 'routes /gadgets/1/edit to #edit' do
      expect(get: '/gadgets/1/edit')
      .to route_to(controller: 'gadgets', action: 'edit', id: '1')
    end

    it 'routes /gadgets/1 to #show' do
      expect(get: '/gadgets/1')
      .to route_to(controller: 'gadgets', action: 'show', id: '1')
    end
  end

  describe 'GET index' do
    before do
      @gadget = create(:gadget)
      get :index
    end

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'should assign gadgets to the view' do
      expect(assigns(:gadgets)).to eq([@gadget])
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the new template' do
      expect(response).to render_template('new')
    end
    it 'should be new Gadget object' do
      expect(assigns(:gadget)).to be_a_new(Gadget)
    end
  end

  describe 'GET edit' do
    before do
      @gadget = create(:gadget)
      get :edit, id: @gadget
    end

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
    it 'should not be new Gadget object' do
      expect(assigns(:gadget)).not_to be_a_new(Gadget)
    end
  end

  describe 'GET show' do
    before { get :show, id: 1 }

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
end
