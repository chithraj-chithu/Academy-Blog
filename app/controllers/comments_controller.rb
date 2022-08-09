class CommentsController < ApplicationController
    def create
        current_user
        user = User.find(current_user.id)
        user_id = user.id
        comment = Comment.new(comment: comment_params[:comment],user_id: user_id,blog_id: params[:blog_id])
        comment.images.attach(comment_params[:images])
        if comment.save
          redirect_to blogs_path
        else
          render plain: "Fail"
        end
      end
      def destroy
        comment = Comment.find(params[:id])
        comment.images.purge
        if comment.destroy
           redirect_to blogs_path
        else
          render plain: "Fail"
        end
      end
      private
      def comment_params
        params.require(:comment).permit(:comment,images: [])
      end
end
