class UsersController < ApplicationController
  
  def new
  end
  
  def index
    @users = User.where(:admin => false)
  end
  
  def show
    @post = Post.new
    if current_user.followers.first.nil?
      @posts = Post.where(:user_id => current_user.id )
    else
      @posts = Post.where(:user_id => current_user.id ) + current_user.followers.first.posts
    end
    @user = User.where(:id => current_user.id ).first
    @users = User.all - current_user.followers - [current_user]
  end
  
  def edit
    @user = User.where(:id => current_user.id ).first
  end
  
  def update
    @user = User.where(:id => current_user.id ).first
    @user.update_attributes(params[:user])
    redirect_to(user_path(@user), :notice => 'User was successfully updated.') 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path, :notice => 'User Deleted!')
  end
  
  def follow
    @user = User.where(:id => params[:id]).first
    current_user.followers << @user
    current_user.save
    redirect_to(user_path(current_user), :notice => 'Following <%= @user.name %>')
  end
  
end
