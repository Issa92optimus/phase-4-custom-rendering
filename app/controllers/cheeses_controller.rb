class CheesesController < ApplicationController


  def index
    cheeses = Cheese.all
    render json: cheeses
  end


  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: "Cheese not found"}, status: 404
    end
  end
end
