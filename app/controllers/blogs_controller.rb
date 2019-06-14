class BlogsController < ApplicationController
    before_action :authenticate_user!, expect: [:index]
  def new
      @blog = Blog.new
      @blog.user_id = current_user.id
      @user = @blog.user
  end
  
  def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
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
      @user = @blog.user
      @blog.destroy
      redirect_to "/users/#{@user.id}", notice:"ブログを削除しました！"
  end
  
  def confirm
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      @user = @blog.user
  end
  
  private
  
  def blog_params
      params.require(:blog).permit(:content)
  end
end
