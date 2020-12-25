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
      Payjp.api_key = "sk_test_aa15eb916bf086383c281bfb"
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
       @purchase.save
       return redirect_to root_path
     else
      render 'index'
    end
 end
  
  private
  def get_id
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(:postal_code, :area_id, :city_town, :house_number, :bilding_number, :phone_number,:price).merge(item_id: params[:item_id],user_id: current_user.id, token: params[:token])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.history.present?
  end
end
