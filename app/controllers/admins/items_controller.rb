class Admins::ItemsController < ApplicationController
  layout 'admins'

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_item_path(@item.id)
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :non_taxed_price, :is_active)
  end
end
