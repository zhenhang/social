class NewsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  
  def index
  	@articles = Article.where(:state => :normal).all
  end

  def show
  	@article = Article.find(params[:id])
  	@replies = @article.replies
    @reply = Reply.new
  end

  def new
    if request.post?
      @article = Article.create(params[:article])
      @article.user = current_user
      @article.state = 'normal'
      @article.save
      redirect_to news_path(@article)
    else
      @article = Article.new
    end
  end

  def edit
  	@article = Article.find(params[:id])
    if request.post?
      @article.update_attributes(params[:article])
      @article.save
      redirect_to news_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.state = :destroyed
      @article.save
      redirect_to all_news_path
    end
  end

  def reply
    @article = Article.find(params[:id])

    @reply = Reply.new
    @reply.repliable = @article
    @reply.floor = @article.replies.count + 1
    @reply.user = current_user
    @reply.content = params[:reply][:content]
    @reply.save

    redirect_to news_path(@article)
  end
end
