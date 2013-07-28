class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:signup, :login, :forgot_pwd, :show, :favs, :topics, :replies, :index,:signup_by_weibo]

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

  def signup_by_weibo
    if request.post?
      @user = User.create!(params[:user])
      User.update(@user.id,:avatar => open(session[:avatar]))
      #@user = User.create!(username:params[:username],imageemail:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
      Authentication.update(session[:authentication_id],:user_id => @user.id)
      #Authentication.create_from_hash(@user.id, omniauth)
    else
      @user = User.new
    end
  end
end
