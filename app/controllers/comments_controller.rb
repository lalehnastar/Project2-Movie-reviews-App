class CommentsController < ApplicationController
  before_action :authorize

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params)
    @comment.name = current_user.name
    @comment.save

    redirect_to movie_path(@movie)
  end
 
  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])

    if @comment.name == current_user.name
      @comment.destroy
    
    redirect_to movie_path(@movie)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end