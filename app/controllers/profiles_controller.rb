class ProfilesController < ApplicationController


  def index
     render json: Profile.all
  end

 def create
   Profile.create(profile_params)
 end

 def show
   render json: Profile.find(params[:id])
 end

 def update
   current_profile = Profile.find(params[:id])
   current_profile.update(profile_params)
 end

 private

 def profile_params
   image = convert_image
   params.permit(:event, :image).merge(image: image)
 end

 def convert_image
   Paperclip.io_adapters.for(params[:image])
 end
end
