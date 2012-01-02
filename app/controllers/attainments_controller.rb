class AttainmentsController < ApplicationController
  before_filter :authenticate_user!

  def index
   @attainments = current_user.attainments.order("due_date").page(params[:page]).per(5)
  end

  def new
    @attainment = Attainment.new
    @attainment.public = true
  end

  def create
    @attainment = current_user.attainments.build(params[:attainment])
    if @attainment && @attainment.save
      redirect_to attainments_path
    else
      render 'attainment/new'
    end
  end

  def show
    @attainment = current_user.attainments.find_by_id(params[:id])
    if @attainment
      @works = @attainment.works
    else
     redirect_to attainments_path
    end
  end

  def edit
    @attainment = current_user.attainments.find_by_id(params[:id])
    if @attainment.nil?
     redirect_to attainments_path
    end
  end

  def update
    @attainment = current_user.attainments.find_by_id(params[:id])
    if @attainment && @attainment.update_attributes(params[:attainment])
      redirect_to @attainment, :flash => { :success => "outcome updated"}
    else
      render 'edit'
    end
  end

  def destroy
    @attainment = current_user.attainments.find_by_id(params[:id])
    if @attainment
       @attainment.destroy
       redirect_to attainments_path, :flash => { :success => "outcome removed"}
    else
       render 'index', :flash => { :error => "outcome not found"}
    end
  end

end
