class CommentsController < ApplicationController
    # def all@comments=Comment.all
    # end

    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    # def create
    #     @article = Article.find(params[:article_id])
    #     @comment = @article.comments.create(comment_params)
    #     redirect_to article_path(@article)
    #   end

      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
        end

      def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(**comment_params,
        user_id:current_user.id,commenter:current_user.full_name)
        redirect_to article_path(@article)
        end 
    
      private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
  
