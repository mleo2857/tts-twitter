class UsersController < ApplicationController

    def index
        @users = User.where.not(username:"mleo")
    end
    
end