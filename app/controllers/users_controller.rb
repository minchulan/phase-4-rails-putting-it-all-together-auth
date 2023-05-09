class UsersController < ApplicationController
wrap_parameters format: []
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    #signup
    def create
        user = User.create!(user_params)
        # if user is valid
        if user.valid?
            # save new user to DB with specific attributes 
            session[:user_id] = user.id #logs user in
            render json: user, status: :created 
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
 
    end 

    #me 
    def show
        # get current user & render it in json
    end 

    #get all 
    def index
        users = User.all
        render json: users, each_serializer: UserSerializer
    end 

    private 
    #error handling
    def render_unprocessable_entity
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end 

    #strong params 
    def user_params
        params.permit(:username, :password, :image_url, :bio)
    end 
end
