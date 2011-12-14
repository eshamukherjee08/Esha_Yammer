class CommentsController < ApplicationController
  
  before_filter :find_comment, :except =>[:new,:create,:index]
  

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end


  def create
    @comment = Comment.new(:comment=>params[:comment][:comment], :user_id => current_user.id)
    @post = Post.find(params[:post][:id].to_i)
    @post.comments << @comment
    redirect_to(post_path(@post), :notice => 'Comment was successfully created.')
  end

  def update
    @comment.update_attributes(params[:comment])
    redirect_to(@comment, :notice => 'Comment was successfully updated.')
  end

  def destroy
    @comment.destroy
    redirect_to(posts_path)
  end
  
  protected
  
    def find_comment
      @comment = Comment.where(:id => params[:id]).first
      redirect_to root_path, :notice=> "Comment not found!!!" unless @comment
    end
end
