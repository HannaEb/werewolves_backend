class AvatarController < ApplicationController



  respond_to :json

  def index


    render json: Avatar.all

  end


  def create
    @avatar = Avatar.new(permitted_params)



     if @avatar.save
       render json: {success: true}
     else
       render json: @avatar.errors
     end
   end


  private
    def permitted_params
      params.permit(:image)
    end


end
