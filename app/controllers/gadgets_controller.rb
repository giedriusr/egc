class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.order('created_at DESC')
  end

  def new
    @gadget = Gadget.new
  end

  def edit
    @gadget = Gadget.find(params[:id])
  end

  def show
  end
end
