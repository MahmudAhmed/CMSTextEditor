class NewslettersController < ApplicationController
  def index 
    @newsletters = Newsletter.all
    render :index
  end
  
  def show 
    @newsletter = Newsletter.find(params[:id])
    @stories = @newsletter.get_stories
    render :show
  end 

  # def new 
  #   @newsletter = Newsletter.new
  #   render :new
  # end

  def create 
    @newsletter = Newsletter.new
    @newsletter.date = Time.now.strftime("%B %d, %Y")
    if @newsletter.save
      render json: @newsletter  
    else
      render json: @newsletter.errors.full_messages
    end
  end 


  # def edit 
  #   @newsletter = Newsletter.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @newsletter = Newsletter.find(params[:id])
  #   if @newsletter.update(stories_param) 
  #     redirect_to story_url(@newsletter.id)  
  #   else
  #     render :edit, status: 422
  #   end
  # end

  def destroy 
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_url
  end

  private 

  def newsletters_param
    params.require(:newsletter).permit(:date, :html)
  end

end