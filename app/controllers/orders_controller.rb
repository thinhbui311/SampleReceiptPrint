class OrdersController < ApplicationController
  before_action :retrieve_order, only: :print_receipt
  before_action :recalculate_price, only: :print_receipt

  def print_receipt
    @line_items = @order.line_items

    respond_to do |format|
      format.json
    end
  rescue => e
    render json: {errors: e.message}, status: :unprocessable_entity
  end

  private

  def retrieve_order
    @order ||= Order.find(params[:id])
  end

  def recalculate_price
    @order.recalculate_price!
  end
end
