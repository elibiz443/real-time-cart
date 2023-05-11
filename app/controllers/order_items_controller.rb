class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    if @order.save
      session[:order_id] = @order.id
      format.html { render :content }
    end
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)

    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to "/", notice: "Item Added" }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
