class LineItemsController < ApplicationController
  def create
    binding.pry

    if current_user.current_cart == nil
      current_user.current_cart = current_user.carts.create
      current_user.save
    end
    current_user.current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_user.current_cart)
  end

end
