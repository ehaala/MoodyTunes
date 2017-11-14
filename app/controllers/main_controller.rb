class MainController < ApplicationController
	before_action :current_user, :is_authenticated

  def index
  end

  def create
  	Favorite.create(favorite_params)
  	redirect_to favorites_path
  end

  def show
  	@favorite = Favorite.new

		uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect')
		uri.query = URI.encode_www_form({
		    # Request parameters
		    'returnFaceId' => 'false',
		    'returnFaceRectangle' => 'false',
		    'returnFaceLandmarks' => 'false',
		    'returnFaceAttributes' => 'emotion'
		})
		request = Net::HTTP::Post.new(uri.request_uri)
		# Request headers
		request['Content-Type'] = 'application/json'
		# NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
		request['Ocp-Apim-Subscription-Key'] = ENV['API_KEY']
		# Request body
		# request.body = "{\"url\":\"http://images.performgroup.com/di/library/sporting_news/39/82/lebron-james-yell-052217-getty-ftrjpg_1biyl0msydg5s1dqs6vm31t7aq.jpg?t=775653340&w=960&quality=70\"}"
		request1 = "{\"url\":\""
		@url = params[:url]
		# url = "https://cdn-s3.si.com/s3fs-public/styles/marquee_large_2x/public/2017/09/15/dirk_nowitzki_marquee_.jpg"
		request3 = "\"}"
		request.body = request1 + @url + request3

		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
		    http.request(request)
		end
		@data = JSON.parse(response.body)
  end

  def favorite_params
  	params.require(:favorite).permit(:url, :user_id)
  end

end
