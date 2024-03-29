class AttainmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :should_see_attainment, :only => [:show, :edit, :update, :destroy]

  def index
   @attainments = current_user.attainments.order("due_date").page(params[:page]).per(5)
  end

  def new
    @attainment = Attainment.new
    @attainment.public = true
  end

  def create
    @attainment = current_user.attainments.build(params[:attainment])
    if @attainment.save
      redirect_to attainments_path
    else
      render 'attainment/new'
    end
  end

  def show
    @attainment = Attainment.find(params[:id])
    @works = @attainment.works
  end

  def edit
    @attainment = Attainment.find(params[:id])
  end

  def update
    @attainment = Attainment.find(params[:id])
    if @attainment.update_attributes(params[:attainment])
      redirect_to @attainment, :flash => { :success => "outcome updated"}
    else
      render 'edit'
    end
  end

  def destroy
    @attainment = Attainment.find(params[:id])
    @attainment.destroy
    redirect_to attainments_path, :flash => { :success => "outcome removed"}
  end
  
  private
  
  def should_see_attainment
    @attainment = Attainment.find(params[:id])
    redirect_to(root_path) unless current_user.id == @attainment.user_id
  end
  
end
