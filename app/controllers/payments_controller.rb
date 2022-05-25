class PaymentsController < ApplicationController
  load_and_authorize_resource
  def index
    @category = Category.find(params[:category_id])
    @category_payments = CategoryPayment.includes(:payment).where(category_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @categories = current_user.categories
  end

  def create
    @payment = Payment.new(name: params[:name], amount: params[:amount])
    @payment.author_id = current_user.id
    respond_to do |format|
      if @payment.save
        category_payment = CategoryPayment.new(category_id: params[:categories], payment_id: @payment.id)
        category_payment.save
        format.html { redirect_to category_payments_path(category_id: params[:categories]), notice: 'Transaction created successfully' }
      else
        format.html { render :new, alert: 'Failed to create transaction' }
      end
    end
  end
end
