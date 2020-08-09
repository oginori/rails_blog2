class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.create(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "Successfully posted！"
      else
        render :new
      end
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Successfully edited!"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Successfully deleted!"
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:name, :title, :content)
    end
end
