class Api::V1::ShowsController < ApplicationController
  def index

    @shows = Show.all

  end

  def new

  end

  def create

    @show = Show.new(datetime: params[:datetime], artsists: params[:artsists], venue: params[:venue], city: params[:city], region: params[:region], country: params[:country])
    if @show.valid?
      @show.save
      render 'show.json'
    else
      redirect_to 'api/v1/shows'
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
        format.html { redirect_to "/api/v1/shows" }
        format.json{ render json: "Show Deleted"}
      end
    else
      redirect_to '/api/v1/shows/index'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
      render json: "Show Deleted"}
    end
  end
end