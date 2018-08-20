class TimelineController < ApplicationController
   
   def index
       @user = User.find_by(username: "objo")
   end
    
end