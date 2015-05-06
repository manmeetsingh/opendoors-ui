class OrdersController < ApplicationController
  def find_orders
    @orders = DiscoveryService.get_orders(1)
    {}
    render
  end

  def view
    @order = DiscoveryService.get_order(params[:order_id])
  end

  def confirm
    @order = DiscoveryService.confirm_order(params[:order_id])
    redirect_to :back
  end

  def start
    @order = DiscoveryService.start_order(params[:order_id], params[:start_time] || Time.now.to_s(:db))
    redirect_to :back
  end

  def complete
    @order = DiscoveryService.complete_order(params[:order_id], params[:end_time] || Time.now.to_s(:db))
    redirect_to :back
  end

  def close
    @order = DiscoveryService.close_order(params[:order_id])
    redirect_to :back
  end

  def cancel
    @order = DiscoveryService.cancel_order(params[:order_id])
    redirect_to :back
  end
end