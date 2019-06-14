class BlogsController < ApplicationController
    before_action :authenticate_user!, expect: [:index]
  def new
      @blog = current_user.blogs.build
      @user = @blog.user
      @user.name
  end
  
  def create
      @blog = current_user.blogs.build(blog_params)
      @user = @blog.user
      @user.name
      if @blog.save
          redirect_to blogs_path, notice:"ブログを作成しました！"
      end
  end

  def index
      @blogs = Blog.all
  end

  def show
      @blog = Blog.find(params[:id])
      @user = @blog.user
  end
  
  def edit
      @blog = Blog.find(params[:id])
      @user = @blog.user
  end
  
  def update
      @blog = Blog.find(params[:id])
      @user = @blog.user
      if @blog.update(blog_params)
          redirect_to "/users/#{@user.id}",notice:"ブログを編集しました！"
      else
          render 'edit'
      end
  end
  
  def destroy
      @blog = Blog.find(params[:id])
      @user  = @blog.user
      @blog.destroy
      redirect_to "/users/#{@user.id}", notice:"ブログを削除しました！"
  end
  
  def confirm
      @blog = current_user.blogs.build(blog_params)
      @user = @blog.user
      @user.name
  end
  
  private
  
  def blog_params
      params.require(:blog).permit(:content)
  end
end
