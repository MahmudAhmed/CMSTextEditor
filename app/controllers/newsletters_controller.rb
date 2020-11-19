require "uri"
require "net/http"

class NewslettersController < ApplicationController
  def index 
    @newsletters = Newsletter.all.order(date: :desc)
    @newsletter = Newsletter.new
    render :index
  end
   
  def show 
    @newsletter = Newsletter.find(params[:id])
    @stories = @newsletter.get_stories
    render :show
  end 


  def create 
    @newsletter = Newsletter.new
    @newsletter.date = Date.parse(newsletters_param["date"]).strftime("%B %d, %Y")
    stories = @newsletter.get_stories
    html = ''
    if stories.empty?
      html = "<h3 id='empty-table'>No stories found for this newsletter :(</h3>"
    else 
      stories.reverse_each do |story| 
        html += render_to_string partial: "story", locals: {story: story}
      end
    end
    @newsletter.html = html
    if @newsletter.save
      url = URI("https://lyra-api.herokuapp.com/api/newsletters")
      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
      form_data = [['date', @newsletter.date], ['html', @newsletter.html]]
      request.set_form form_data, 'multipart/form-data'
      response = https.request(request)
      @newsletter.lyraID = JSON.parse(response.body)["data"]["id"]
      @newsletter.save
      redirect_to newsletters_url 
    else
      @newsletters = Newsletter.all.order(date: :desc)
      render :index
    end
  end 

  def update
    @newsletter = Newsletter.find(params[:id])
    @stories = @newsletter.get_stories
    html = ''
    @stories.reverse_each do |story| 
      html += render_to_string partial: "story", locals: {story: story}
    end

    @newsletter.html = html
    if @newsletter.save
      url = URI("https://lyra-api.herokuapp.com/api/newsletters/" + @newsletter.lyraID)
      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true
      request = Net::HTTP::Patch.new(url)
      request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
      form_data = [['date', @newsletter.date],['html', @newsletter.html]]
      request.set_form form_data, 'multipart/form-data'
      https.request(request)
      redirect_to newsletter_url(@newsletter.id)  
    else
      render :edit, status: 422
    end
  end

  def destroy 
    @newsletter = Newsletter.find(params[:id])
    url = URI("https://lyra-api.herokuapp.com/api/newsletters/" + @newsletter.lyraID)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    request = Net::HTTP::Delete.new(url)
    request["Authorization"] = "Bearer WBktXBdQAGL717bfLaUMbRr2"
    https.request(request)
    puts 
    @newsletter.destroy
    redirect_to newsletters_url
  end

  private 

  def newsletters_param
    params.require(:newsletter).permit(:date)
  end

end