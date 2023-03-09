class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article.id)
    else
      puts @comment.errors.messages
      puts 'not worked'
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @article = Article.find(params[:article_id])
  end  
end
