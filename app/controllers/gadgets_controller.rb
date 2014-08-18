class GadgetsController < ApplicationController
  before_action :set_gadget, only: [:edit, :update]

  def index
    @gadgets = Gadget.order('created_at DESC')
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new

    if @gadget.update_attributes(gadget_params)
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
      flash[:success] = 'Updated'
      redirect_to edit_gadget_path(@gadget)
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_gadget
    @gadget = Gadget.find(params[:id])
  end

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
