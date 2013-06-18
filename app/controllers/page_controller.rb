class PageController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  
  def index
  	@pages = Page.all
  end

  def new
    if request.post?
      @page = Page.create(params[:page])
      redirect_to page_path(@page)
    else
      @page = Page.new
    end
  end

  def edit
  	@page = Page.find(params[:id])
    if request.post?
      @page.update_attributes(params[:page])
      redirect_to page_path(@page)
    end
  end

  def show
  	@page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.user == current_user
      @page.delete
      redirect_to pages_path
    end
  end
end
