class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :state_id, :burden_id, :area_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
