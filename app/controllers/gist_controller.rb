class GistController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]

  def index
  	@gists = Gist.all
  end

  def new
    if request.post?
      @gist = Gist.create(params[:gist])
      @gist.user = current_user
      @gist.save
      redirect_to gist_path(@gist)
    else
      @gist = Gist.new
    end
  end

  def edit
  	@gist = Gist.find(params[:id])
    if request.post?
      @gist.update_attributes(params[:gist])
      redirect_to gist_path(@gist)
    end
  end

  def show
  	@gist = Gist.find(params[:id])
  	@replies = @gist.replies
    @reply = Reply.new
  end

  def destroy
    @gist = Gist.find(params[:id])
    if @gist.user == current_user
      @gist.delete
      redirect_to gists_path
    end
  end

  def reply
    @gist = Gist.find(params[:id])

    @reply = Reply.new
    @reply.repliable = @gist
    @reply.floor = @gist.replies.count + 1
    @reply.user = current_user
    @reply.content = params[:reply][:content]
    @reply.save

    redirect_to news_path(@gist)
  end
end
