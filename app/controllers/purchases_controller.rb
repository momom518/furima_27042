class PurchasesController < ApplicationController
  before_action :move_to_login
  before_action :move_to_root, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    @purchase = PurchaseForm.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    @customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )
    @purchase = PurchaseForm.new(purchase_params)

    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @purchase = PurchaseForm.new
      render :new
    end
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code,
                                          :prefecture_id,
                                          :city,
                                          :house_number,
                                          :building_name,
                                          :telephone_number,
                                          :item_id).merge(user_id: current_user.id,
                                                          item_id: params[:item_id],
                                                          card_token: params[:card_token],
                                                          customer_token: @customer.id)
  end
end
