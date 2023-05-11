class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    puts "showcities"*10
  end

end

