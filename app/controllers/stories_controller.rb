require "uri"
require "net/http"


class StoriesController < ApplicationController
  def index 
    @stories = Story.all

    render :index
  end
  
  def show 
    @story = Story.find(params[:id])
    render :show
  end 

  def new 
    @story = Story.new
    render :new
  end

  def create 
    @story = Story.new(stories_param)
    @story.tag.upcase! 
    if @story.save
      url = URI("https://lyra-api.herokuapp.com/api/stories")
      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
      form_data = [['html', @story.body],['title', @story.title], ['tag', @story.tag]]
      request.set_form form_data, 'multipart/form-data'
      
      response = https.request(request)
      @story.lyraID = JSON.parse(response.body)["data"]["id"]
      @story.save
      redirect_to story_url(@story.id)  
    else
      render :new, status: 422
    end
  end 


  def edit 
    @story = Story.find(params[:id])
    render :edit
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(stories_param) 
      url = URI("https://lyra-api.herokuapp.com/api/stories/" + @story.lyraID)
      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true
      request = Net::HTTP::Patch.new(url)
      request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
      form_data = [['html', @story.body],['title', @story.title], ['tag', @story.tag]]
      request.set_form form_data, 'multipart/form-data'
      response = https.request(request)
      redirect_to story_url(@story.id)  
    else
      render :edit, status: 422
    end
  end

  def destroy 
    @story = Story.find(params[:id])
    url = URI("https://lyra-api.herokuapp.com/api/stories/" + @story.lyraID)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Delete.new(url)
    request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"

    response = https.request(request)

    @story.destroy
    redirect_to stories_url
  end

  private 

  def stories_param
    params.require(:story).permit(:title, :tag, :body)
  end

end
