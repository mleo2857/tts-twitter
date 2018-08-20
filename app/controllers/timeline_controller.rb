class TimelineController < ApplicationController
   
   def index
       @user = User.find_by(username: "mleo")
   end
    
end