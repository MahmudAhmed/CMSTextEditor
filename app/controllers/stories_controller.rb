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
    render :new
  end

  def create 
    @story = Story.new(stories_param)
    if @story.save
      redirect_to story_url(@story.id)  
    else
      render json: @story.errors.full_messages, status: 422
    end
  end 

  def update
    @story = Story.find(params[:id])

    if @story.update(stories_param) 
      render json: @story  
    else
      render json: @story.errors.full_messages, status: 422
    end
  end

  def destroy 
    @story = Story.find(params[:id])
    @story.destroy
    render json: ["Successfully Deleted"], status: 200
  end

  private 

  def stories_param
    params.require(:story).permit(:title, :tag, :body)
  end

end
