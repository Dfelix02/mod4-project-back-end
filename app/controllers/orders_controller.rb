class OrdersController < ApplicationController
    def index
        orders = Order.all
        render json: orders
    end

    def show 
        order = Order.find(params[:id])
        render json: order
    end

    def create
        order = Order.create(order_params)
        render json: order
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        render json: order
    end
    
    def destroy 
        order = Order.find(params[:id])
        order.destroy
        render json: order
    end


    private

    def order_params
        params.permit(:item_id, :purchase_id, :quantity)
    end
end
