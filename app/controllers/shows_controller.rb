class ShowsController < ApplicationController

  def index

    @shows = Show.all

  end

  def new

  end

  def create

    @show = Show.new(datetime: params[:datetime], artsists: params[:artsists], venue: params[:venue], city: params[:city], region: params[:region], country: params[:country])
    if @show.valid?
      @show.save
      render 'show'
    else
      redirect_to '/shows/index.json'
    end

  end

  def show

    @show = Show.find(params[:id])
    #render json: @show #shortcut to display all employee fields without using jbuilder

  end

  def edit

  end

  def update
    @show = Show.find(params[:id])
    if @show
      @show.update(datetime: params[:datetime], artsists: params[:artsists], venue: params[:venue], city: params[:city], region: params[:region], country: params[:country])
      respond_to do |format|
        format.html { redirect_to "/shows" }
        format.json{ render json: "Show Deleted"}
      end
    else
      redirect_to 'shows/index'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to "/shows" }
      format.json{ render json: "Show Deleted"}
    end
  end
end
