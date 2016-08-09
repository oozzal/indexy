class WebPagesController < ApplicationController
  before_action :set_web_page, only: [:show, :edit, :update, :destroy]

  def index
    @web_pages = WebPage.order('created_at DESC').page params[:page]
  end

  def show
    @web_pages = WebPage.order('created_at DESC').page params[:page]
    render 'index'
  end

  def new
    @web_page = WebPage.new
  end

  def edit
  end

  def create
    @web_page = WebPage.new(web_page_params)

    respond_to do |format|
      if @web_page.save
        format.html { redirect_to @web_page, notice: 'Web page was successfully created.' }
        format.json { render :show, status: :created, location: @web_page }
      else
        format.html { render :new }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @web_page.update(web_page_params)
        format.html { redirect_to @web_page, notice: 'Web page was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_page }
      else
        format.html { render :edit }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @web_page.destroy
    respond_to do |format|
      format.html { redirect_to web_pages_url, notice: 'Web page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_web_page
    @web_page = WebPage.find(params[:id])
  end

  def web_page_params
    params.fetch(:web_page, {}).permit(:url)
  end
end
