# Controller that shows the animal display

class AnimalDisplayController < ApplicationController

  # Get the current considering, so it can be displayed
  include CurrentConsidering

  # Ensure that the considering is set before continuing with display
  before_action :set_considering

  # Helper method declaration so that pets can be sorted
  helper_method :sort_column, :sort_direction
  
  # Index action, automatically sorts the page 
  def index
    @pets = Pet.order(sort_column + " " + sort_direction)
  end
  
  # ...
  
  private
  
  # Helper method to sort by column
  def sort_column
    Pet.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  # Helper method to choose ascending or descending
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
