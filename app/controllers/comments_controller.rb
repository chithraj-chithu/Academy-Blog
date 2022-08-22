# frozen_string_literal: true

class CommentsController < ApplicationController
  def new_comment
    @comments = Comment.where(blog_id: params[:blog_id])
    p '============================================'
    p '============================================'
    p '============================================'
    p '============================================'
    p @comments
    render 'blogs/_show'
  end

  def comment_create
    p '================================================'
    p '================================================'
    p '================================================'
    p '================================================'
    p params[:comment]
    p params[:blog_id]
    Comment.create!(user_id: @current_user.id, blog_id: params[:blog_id], comment: params[:comment])
    redirect_to request.referrer
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, images: [])
  end
end
