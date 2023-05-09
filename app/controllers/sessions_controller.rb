class SessionsController < ApplicationController
    skip_before_action :authorized, only: :create 
    
    #login 
    def create
    end 

    #logout 
    def destroy
    end 
end
