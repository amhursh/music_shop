class CartsController < ApplicationController

  def show
    @items = Item.where(id: session[:cart].keys)
  end

  def create
    id = params["item_id"].to_s
    @item = Item.find_by(id: id)
    session[:cart] ||= Hash.new(0)
    session[:cart][id] = (session[:cart][id] || 0) + 1
    redirect_back(fallback_location: items_path)
  end

  def destroy
    session[:cart].delete(params[:id].to_s)
    redirect_to cart_path
  end
end