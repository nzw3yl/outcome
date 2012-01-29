class SuggestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :should_own_attainment, :only => :create
  
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
    @user_from_email = User.find_by_email(params[:suggestion][:email])
    if @user_from_email
      @suggestion.update_attribute(:user_id, @user_from_email.id)
    end
    if @suggestion.save
      redirect_to new_suggestion_path(:id => params[:suggestion][:attainment_id])
    else
      render attainments_path
    end
  end

  def show
  end

  def destroy
  end
  
  private
  
  def should_own_attainment
    redirect_to(attainments_path) unless current_user.attainments.find_by_id(params[:suggestion][:attainment_id])
  end
 
end
