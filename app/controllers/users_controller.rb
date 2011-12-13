class UsersController < ApplicationController
  
  def new
  end
  
  def index
    @users = User.where(:admin => false)
  end
  
  def show
    @post = Post.new
    @posts = Post.where(:user_id => current_user.id )
    @user = User.where(:id => current_user.id ).first
  end
  
  def edit
    @user = User.where(:id => current_user.id ).first
  end
  
  def update
    @user = User.where(:id => current_user.id ).first
    if @user.update_attributes(params[:user])
      redirect_to(user_path(@user), :notice => 'User was successfully updated.')
    else
      render :action => "edit" 
    end  
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path, :notice => 'User Deleted!') }
    end
  end
  
  
  
end
