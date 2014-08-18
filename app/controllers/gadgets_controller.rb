class GadgetsController < ApplicationController
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
    @gadget = Gadget.find(params[:id])
  end

  def show
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end
end
