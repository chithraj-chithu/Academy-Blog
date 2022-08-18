# frozen_string_literal: true

class BlogsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    @count = 0
    current_user
    @blogs = Blog.all
    @user = User.all
    @comments = Comment.all
    @presence = 0
    if current_user
      @presence = 1
      @current_user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'blogs/index'
  end

  def create
    current_user
    user = User.find(current_user.id)
    user_id = user.id
    blog = Blog.new(blog: blog_params[:blog], user_id: user_id, title: blog_params[:title])
    blog.images.attach(blog_params[:images])
    if blog.save
      redirect_to blogs_path
    else
      render plain: 'Fail'
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.images.purge
    if blog.destroy
      redirect_to blogs_path
    else
      render plain: 'Fail'
    end
  end

  def reaction
    current_user
    user = User.find(current_user.id)
    user_id = user.id
    blog_reaction = BlogReaction.new(reaction: params[:reaction], user_id: current_user.id, blog_id: params[:blog_id])
    if blog_reaction.save
      redirect_to blogs_path
    else
      render plain: 'Failed'
    end
  end

  def reaction_update
    current_user
    user = User.find(current_user.id)
    user_id = user.id
    blog_reaction = BlogReaction.find(params[:reaction_id])
    blog_reaction.reaction = params[:reaction]
    if blog_reaction.save
      redirect_to blogs_path
    else
      render plain: 'Failed'
    end
  end

  def reaction_delete
    blog_reaction = BlogReaction.find(params[:reaction_id])
    if blog_reaction.destroy
      redirect_to blogs_path
    else
      render plain: 'Failed'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:blog, :title, images: [])
  end
end
