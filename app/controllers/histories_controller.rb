class HistoriesController < ApplicationController
  before_action :get_id, only:[:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
     if @purchase.valid?
       @purchase.save
       redirect_to root_path
     else
      render 'index'
    end
 end
  
  private
  def get_id
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(:postal_code, :area_id, :city_town, :house_number, :bilding_number, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
end
