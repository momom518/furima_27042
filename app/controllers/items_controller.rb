class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_login, except: [:index, :show]
  before_action :move_to_root, only: [:edit, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :image,
      :information,
      :category_id,
      :condition_id,
      :prefecture_id,
      :delivery_id,
      :postage_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    redirect_to root_path unless @item.user.id == current_user.id
  end

end
