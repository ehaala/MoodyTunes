class FavoritesController < ApplicationController
	before_action :current_user, :is_authenticated
	
  def edit
  end

  def create
  	Favorite.create(favorite_params)
  	redirect_to favorites_path
  end

  def index
  end

  def new
  end

  def show
  end

  def destroy
    Favorite.find(params[:id]).delete
    redirect_to favorites_path
  end

  def favorite_params
  	params.require(:favorite).permit(:url, :user_id)
  end
end
