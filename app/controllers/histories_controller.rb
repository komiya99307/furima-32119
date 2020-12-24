class HistoriesController < ApplicationController
  before_action :get_id, only:[:index, :create]
  
  
  def index
    @purchase = Purshase.new
  end


  
  
  private
  def get_id
    @item = Item.find(params[:item_id])
  end
end
