class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.order('created_at DESC')
  end

  def new
  end

  def edit
  end

  def show
  end
end
