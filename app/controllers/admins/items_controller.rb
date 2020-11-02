class Admins::ItemsController < ApplicationController
  layout 'admins'
  
  def new
    @item = Item.new
  end
  
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_item_path
  end
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :non_taxed_price, :is_active)
  end
end
