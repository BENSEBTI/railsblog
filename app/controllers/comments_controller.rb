class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(article_params)
		redirect_to article_path(@article)
	end

	private

	def article_params
		params.require(:comment).permit(:user, :email, :commentaire)
	end

	
end
