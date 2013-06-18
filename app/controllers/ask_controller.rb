class AskController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]

  def index
    @questions = Question.where(:state => :normal).all
  end

  def new
    if request.post?
      @question = Question.create(params[:question])
      @question.user = current_user
      @question.state = 'normal'
      @question.save
    else
      @question = Question.new
    end
  end

  def edit
    @question = Question.find(params[:id])
    if request.post?
      @question.update_attributes(params[:question])
      redirect_to question_path(@question)
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.state = 'destroyed' 
      @question.save
    end
  end

  def answer
    if request.post?
      @question = Question.find(params[:id])

      @answer = Answer.new
      @answer.question_id = @question.id
      @answer.user = current_user
      @answer.floor = @question.answers.count + 1
      @answer.content = params[:content]
      @answer.save

      puts ask_path(@question)
      redirect_to ask_path(@question)
    end
  end

  def reply
    @question = Question.find(params[:id])

    @reply = Reply.new
    @reply.repliable = @question
    @reply.user = @user
    @reply.content = params[:content]
    @reply.save

    redirect_to ask_path(@question)
  end

  def fav
    @question = Question.find(params[:id])

    favorite = Fav.new
    favorite.share_id = @question.id
    favorite.user_id = current_user.id
    favorite.save

    render :status => 200
  end

  def unfav
    @question = Question.find(params[:id])

    favorite = Fav.where(:user_id => current_user.id, :share_id => @question.id).first
    favorite.delete
    render :status => 200
  end

  def up
    @answer = Answer.find(params[:answer_id])
    @answer.rate += 5
    @answer.save
    
    render :status => 200
  end

  def down
    @answer = Answer.find(params[:answer_id])
    @answer.rate -= 5
    @answer.save
    
    render :status => 200
  end

  def select
  	@question = Question.find(params[:id])
    @answer = Answer.find(params[:answer_id])
    @question.selected = @answer
    @question.state = :closed
    @question.save

    redirect_to question_path(@question)
  end

  def ban
    if @user.blank? || @user.state != 'admin'
      redirect_to '/'
      return
    end

    @question = Question.find(params[:share_id])
    @question.state = 'ban'
    @question.save

    render :status => 200
  end
end
