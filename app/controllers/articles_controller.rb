class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.joins(:user).select('articles.*, users.username').order('articles.created_at DESC')
  end

  def your_articles
    @articles = Article.joins(:user).select('articles.*, users.username').where(user_id: "1").order('articles.created_at DESC')
  end

  def show
    @user = User.find_by(id: @article.user_id)
    @comments = Comment.joins(:user).select('comments.*, users.username').where(article_id: @article.id).order('comments.created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :about, :body).merge(user_id: "1")
  end
end
