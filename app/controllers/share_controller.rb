class ShareController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:search, :index, :node, :show]

  def search
  end

  def index
    @shares = Share.where(:state => :normal).all
  end

  def node
    @nodename = params[:node]
    @shares = Share.where(:node => @nodename, :state => :normal)
  end

  def new
    @nodename = params[:node]
    if request.post?
      @share = Share.create(params[:share])
      @share.node = @nodename
      @share.state = 'normal'
      @share.user = current_user
      @share.save
      redirect_to share_path(@share)
    else
      @share = Share.new
    end
  end

  def edit
    @share = Share.find(params[:id])
    if request.post?
      @share.update_attributes(params[:share])
      @share.save
      redirect_to share_path(@share)
    end
  end

  def show
    @share = Share.find(params[:id])
    @replies = @share.replies
    @reply = Reply.new
  end

  def destroy
    @share = Share.find(params[:id])
    if @share.user == @user
      @share.state = 'destroyed' 
      @share.save
      redirect_to shares_path
    end
  end

  def reply
    @share = Share.find(params[:id])

    @reply = Reply.new
    @reply.repliable = @share
    @reply.floor = @share.replies.count + 1
    @reply.user_id = current_user.id
    @reply.content = params[:reply][:content]
    @reply.save

    @share.last_reply_id = current_user.id
    @share.last_reply_user_name = @user.username
    @share.save

    redirect_to share_path(@share)
  end

  def fav
    @share = Share.find(params[:id])

    favorite = Fav.new
    favorite.share_id = @share.id
    favorite.user_id = current_user.id
    favorite.save

    redirect_to share_path(@share.id)
    render :status => 200
  end

  def unfav
    @share = Share.find(params[:id])

    favorite = Fav.where(:user_id => current_user.id, :share_id => @share.id).first
    favorite.delete
    render :status => 200
  end

  def thanks
    @share = Share.find(params[:id])
    @share.rate += 5
    @share.save
    
    render :status => 200
  end

  def ban
    if @user.blank? || @user.state != 'admin'
      redirect_to '/'
      return
    end

    @share = Share.find(params[:share_id])
    @share.state = 'ban'
    @share.save

    render :status => 200
  end
end
