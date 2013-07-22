class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:signup, :login, :forgot_pwd, :show, :favs, :topics, :replies, :index]

  def signup
  end

  def login
  end

  def logout
    sign_out :user 
    redirect_to root_path
  end

  def change_pwd
  end

  def forgot_pwd
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.all
    @replies = @user.replies.all
  end

  def setting
    if request.post?
      current_user.update_attributes(params[:user])      
    end
  end

  def avatar
    if request.post?
      current_user.update_attributes(params[:user])
    end
  end

  def favs
    @favorites = current_user.favs.all # todo: use include
    @topics = @favorites.map{|e| Topic.find(e.topic_id)}
  end
  
  def topics
    @user = User.find(params[:id])
    @topics = @user.topics.all
  end

  def replies
    @user = User.find(params[:id])
    @topics = @user.replies.all
  end
end
