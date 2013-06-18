class TopicsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :node, :show]

  def index
    @topics = Topic.where(:state => :normal).all
    # flash[:notice] = "vvvvvv"
  end

  def node
    @nodename = params[:node]
    @topics = Topic.where(:node => @nodename, :state => :normal)
  end

  def new
    @nodename = params[:node]
    if request.post?
      @topic = Topic.create(params[:topic])
      @topic.node = @nodename
      @topic.state = 'normal'
      @topic.user = current_user
      @topic.save
      redirect_to topic_path(@topic)
    else
      @topic = Topic.new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    if request.post?
      @topic.update_attributes(params[:topic])
      redirect_to topic_path(@topic)
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @replies = @topic.replies
    @reply = Reply.new
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.user == @user
      @topic.state = 'destroyed' 
    end
  end

  def reply
    @topic = Topic.find(params[:id])

    @reply = Reply.new
    @reply.repliable = @topic
    @reply.floor = @topic.replies.count + 1
    @reply.user_id = current_user.id
    @reply.content = params[:reply][:content]
    @reply.save

    @topic.last_reply_id = current_user.id
    @topic.last_reply_user_name = current_user.username
    @topic.save

    redirect_to topic_path(@topic)
  end

  def fav
    @topic = Topic.find(params[:id])

    favorite = Fav.new
    favorite.topic_id = @topic.id
    favorite.user_id = current_user.id
    favorite.save

    redirect_to topic_path(@topic.id)
    render :status => 200
  end

  def unfav
    @topic = Topic.find(params[:id])

    favorite = Fav.where(:user_id => current_user.id, :topic_id => @topic.id).first
    favorite.delete
    render :status => 200
  end

  def like
    @topic = Topic.find(params[:id])
    @topic.rate += 5
    @topic.save
    
    render :status => 200
  end

  def dislike
    @topic = Topic.find(params[:id])
    @topic.rate -= 5
    @topic.save
    
    render :status => 200
  end

  def ban
    if @user.blank? || @user.state != 'admin'
      redirect_to '/'
      return
    end

    @topic = Topic.find(params[:topic_id])
    @topic.state = 'ban'
    @topic.save

    render :status => 200
  end
end
