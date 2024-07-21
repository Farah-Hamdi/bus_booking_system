class BusesController < ApplicationController
  def index
    render json: Bus.all
  end
end
