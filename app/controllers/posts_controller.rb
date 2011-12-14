class PostsController < ApplicationController

  before_filter :find_post, :except =>[:new,:create,:index]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @user = @post.user_id
  end

  def new
    @post = Post.new
  end


  def edit
  end


  def create
    @post = Post.new(params[:post].merge!({ :user_id => current_user.id }))
    @post.save
    redirect_to(user_path(current_user.id), :notice => 'Post was successfully created.')
  end


  def update
    @post.update_attributes(params[:post])
    redirect_to(@post, :notice => 'Post was successfully updated.')
  end

  def destroy
    @post.destroy
    redirect_to(posts_path, :notice => 'Post Deleted!')
  end
  
  protected
  
    def find_post
      @post = Post.where(:id => params[:id]).first
      redirect_to root_path, :notice=> "Post not found!!!" unless @post
    end
end
