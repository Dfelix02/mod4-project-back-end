class UsersController < ApplicationController
    
    def login 
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: {error: "Incorrect Username or Password"}, status:422
        end
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user
        else
            render json: {error: "INVALID USER"}, status:422
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end
    
    def destroy 
        user = User.find(params[:id])
        user.destroy
        render json: user
    end


    private

    def user_params
        params.permit(:email, :username, :password, :first_name, :last_name, :address1, :address2, :city, :country, :zip, :phone)
    end
end
