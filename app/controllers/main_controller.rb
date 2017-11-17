class MainController < ApplicationController
	before_action :current_user, :is_authenticated

  def index
  end

  def create
  end

  def show
  	@favorite = Favorite.new
  	@mood = Mood.new

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
		request1 = "{\"url\":\""
		@url = params[:url]
		
		# error handling
		res = @url.nil? rescue true
		unless res
		request3 = "\"}"
		request.body = request1 + @url + request3
		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
		  http.request(request)
		end
		@data = JSON.parse(response.body)
		if @data.nil?
			redirect_to root_path
		end
		@anger = @data[0]['faceAttributes']['emotion']['anger']
		@contempt = @data[0]['faceAttributes']['emotion']['contempt']
		@disgust = @data[0]['faceAttributes']['emotion']['disgust']
		@fear = @data[0]['faceAttributes']['emotion']['fear']
		@sadness = @data[0]['faceAttributes']['emotion']['sadness']
		@happiness = @data[0]['faceAttributes']['emotion']['happiness']
		@neutral = @data[0]['faceAttributes']['emotion']['neutral']
		@surprise = @data[0]['faceAttributes']['emotion']['surprise']
		end

  end

end
