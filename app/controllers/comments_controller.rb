class CommentsController < ApplicationController

  before_action :set_comment
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    
    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@comment.article_id), notice: 'Comment was successfully destroyed.'
    else
      redirect_to article_path(@comment.article_id), notice: 'Comment was not successfully destroyed.'
    end
  end

  private
  def set_comment
    @user = User.find_by(id:'1')
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id).merge(user_id: "1")
  end

end