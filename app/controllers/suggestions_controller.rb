class SuggestionsController < ApplicationController
  def index
  end

  def new
   @attainment = Attainment.find_by_id(params[:id])
   if current_user.attainments.find_by_id(@attainment).nil?
     redirect_to attainments_path
   else
     @suggestions = @attainment.suggestions.all
     @suggestion = @attainment.suggestions.new
   end 
   
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      redirect_to new_suggestion_path
    else
      render attainments_path
    end
  end

  def show
  end

  def destroy
  end

end
