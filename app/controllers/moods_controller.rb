class MoodsController < ApplicationController
	before_action :current_user, :is_authenticated

  def edit
  end

  def create
  	Mood.create(mood_params)
  	redirect_to moods_path
  end

  def index
  end

  def new
  end

  def show
  end

  def destroy
    Mood.find(params[:id]).delete
    redirect_to moods_path
  end

  def mood_params
  	params.require(:mood).permit(:image, :anger, :contempt, :disgust, :fear, :sadness, :happiness, :neutral, :surprise,:user_id)
  end
end
