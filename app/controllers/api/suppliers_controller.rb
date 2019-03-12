class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render 'index.json.jbuilder'
  end

  def show
    @supplier = Supplier.find(params[:id])
    render 'show.json.jbuilder'
  end
end
