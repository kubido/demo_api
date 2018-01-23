class PagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    page = params_page[:page].to_i || 1
    @pages = Page.page(page).per(20)
    render json: {data: @pages, status: response.status}
  end

  def create
    page = Page.savePage(params[:url])
    render json: page
  end

  private

  def params_page
    params.permit(:page, :url)
  end
end
