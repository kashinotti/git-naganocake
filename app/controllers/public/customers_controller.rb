class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
        @user = User.find(params[:id])
        @user.update(is_deleted: true)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
  end


end
