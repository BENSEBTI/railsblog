class CommentsController < ApplicationController
	
	def index
	@article = Article.find(params[:article_id])
	@comment = @article.comments.all
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(article_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to article_path(@article)
	end
	
	def destroy
	@article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
	end

	private

	def article_params
		params.require(:comment).permit(:user, :email, :commentaire, :user_id)
	end

	
end
