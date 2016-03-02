class ArticlesController < ApplicationController
  
 before_action :authenticate_user! ,only: [:new, :edit]
  
  def index
    @article = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = current_user.articles.new(params.require(:article).permit(:title, :author, :imgurl, :text,:user_id))
  	if @article.save
      redirect_to @article
      else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])

  end

  def edit
    @article = Article.find(params[:id])
    unless current_user.id == @article.user_id
    redirect_to @article
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :author, :imgurl, :text))
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
