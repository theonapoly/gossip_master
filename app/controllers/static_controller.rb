class StaticController < ApplicationController
  def welcome
    @first_name = params[:first_name]
  end

  def form
    puts "$" * 80
    puts "Fomulaire nouveau potin "
    puts "$" * 80
  end

  def contact
    puts "$" * 80
    puts "Page : Nous contacter"
    puts "$" * 80
  end

  def team
    puts "$" * 80
    puts "Page : Team"
    puts "$" * 80
  end

end
