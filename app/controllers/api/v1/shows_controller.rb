class Api::V1::ShowsController < ApplicationController
  def index

    @shows = Show.all
    render json: @shows

  end

  def new

  end

  def create

    @show = Show.new(datetime: params[:datetime], artsists: params[:artsists], venue: params[:venue], city: params[:city], region: params[:region], country: params[:country])
    if @show.valid?
      @show.save
      render json: @show
    else
      render json: { errors: @show.errors.full_messages }, status: 422
    end

  end

  def show

    @show = Show.find(params[:id])
    render json: @show #shortcut to display all employee fields without using jbuilder

  end

  def edit

  end

  def update
    @show = Show.find(params[:id])
    if @show
      @show.update(datetime: params[:datetime], artsists: params[:artsists], venue: params[:venue], city: params[:city], region: params[:region], country: params[:country])
        render json: {message: "Show Updated"}
    else
      render json: { errors: @show.errors.full_message }, status: 418
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    render json: {message: "Show deleted!"}
  end

  def search
    search_string = params[:search_string].downcase
    search_by = params[:search_by]
    @shows_subset = Show.where("LOWER(#{search_by}) LIKE ?", "%#{search_string}%")
    render json: @shows_subset
  end

end
