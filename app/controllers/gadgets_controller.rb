class GadgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gadget, only: [:edit, :update, :destroy, :show]

  def index
    @gadgets = current_user.gadgets

    if params[:search]
      @gadgets = @gadgets.search_by_name_or_description(params[:search])
    end
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(user_id: current_user.id)

    if @gadget.update_attributes(gadget_params)
      handle_images_upload

      flash[:success] = 'Saved'
      redirect_to gadgets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gadget.update_attributes(gadget_params)
      handle_images_upload

      flash[:success] = 'Updated'
      redirect_to edit_gadget_path(@gadget)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @gadget.destroy

    flash[:success] = 'Deleted'
    redirect_to gadgets_path
  end

  private

  def handle_images_upload
    if params[:images]
      params[:images].each do |image|
        @gadget.photos.create(image: image)
      end
    end
  end

  def set_gadget
    @gadget = Gadget.find_by(id: params[:id], user_id: current_user.id)
  end

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
