class PagesController < ApplicationController
  def index
    page = params[:page] || 1
    @pages = Page.page(page).per(20)
    render json: @pages
  end

  def create
    page = Page.savePage(params[:url])
    render json: page
  end
end
