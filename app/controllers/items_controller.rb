class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item_user, only: [:edit, :update,:destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else

      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :delivery_fee_id,
                                 :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_user
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
