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

    it 'routes /gadgets to #create' do
      expect(post: '/gadgets')
      .to route_to(controller: 'gadgets', action: 'create')
    end

    it 'routes /gadgets/1/edit to #edit' do
      expect(get: '/gadgets/1/edit')
      .to route_to(controller: 'gadgets', action: 'edit', id: '1')
    end

    it 'routes /gadgets/1 to #update' do
      expect(put: '/gadgets/1')
      .to route_to(controller: 'gadgets', action: 'update', id: '1')
    end

    it 'routes /gadgets/1 to #show' do
      expect(get: '/gadgets/1')
      .to route_to(controller: 'gadgets', action: 'show', id: '1')
    end

    it 'routes /gadgets/1 to #destroy' do
      expect(delete: '/gadgets/1')
      .to route_to(controller: 'gadgets', action: 'destroy', id: '1')
    end
  end

  before do
    @user = create(:user)
    sign_in :user, @user
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
    it 'assigns gadgets to the view' do
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

  describe 'POST create' do
    before do
      post 'create', gadget: { name: 'gadget', description: 'cool gadget' }
    end

    it 'creates new gadget' do
      expect(Gadget.count).to eq(1)
    end
    it 'has given name' do
      expect(Gadget.first.name).to eq('gadget')
    end
    it 'has given description' do
      expect(Gadget.first.description).to eq('cool gadget')
    end
    it 'belongs to signed_in user' do
      expect(Gadget.first.user.email).to eq(@user.email)
    end
    it 'redirects to index' do
      expect(response).to redirect_to gadgets_path
    end
    it 'throws flash success message' do
      expect(flash[:success]).to eq('Saved')
    end
  end

  describe 'GET edit' do
    before do
      @gadget = create(:gadget, user: @user)
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

  describe 'PUT update' do
    before do
      @gadget = create(:gadget, user: @user)
      put 'update', id: @gadget, gadget: { name: 'new name', description: 'updated' }
    end

    it 'updates gadget' do
      a = Gadget.find(@gadget)
      expect(a.name).to eq('new name')
      expect(a.description).to eq('updated')
    end
    it 'redirects to edit' do
      expect(response).to redirect_to edit_gadget_path(@gadget)
    end
    it 'throws flash success message' do
      expect(flash[:success]).to eq('Updated')
    end
  end

  describe 'GET show' do
    before do
      @gadget = create(:gadget, user: @user)
      get :show, id: @gadget
    end

    it 'returns http success' do
      expect(response).to be_success
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'assigns gadget to the view' do
      expect(assigns(:gadget)).to eq(@gadget)
    end
  end

  describe 'DELETE destroy' do
    before do
      @gadget = create(:gadget, user: @user)
      expect(Gadget.count).to eq(1)

      delete 'destroy', id: @gadget
    end

    it 'deletes a record' do
      expect(Gadget.count).to eq(0)
    end
    it 'redirect to index' do
      expect(response).to redirect_to gadgets_path
    end
    it 'throws success message' do
      expect(flash[:success]).to eq('Deleted')
    end
  end
end
