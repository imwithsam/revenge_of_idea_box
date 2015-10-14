class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      render json: @idea
    else
      render json: @idea.errors.full_messages
    end
  end

  def destroy
    @idea = Idea.destroy(params[:id])

    render json: @idea
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update_attributes(idea_params)
      render json: @idea
    else
      render json: @idea.errors.full_messages
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
