class WorksController < ApplicationController
  def index
  end

  def new
   @work = Work.new
   @work.user_id = current_user.id
  end

  def create
   @work = current_user.works.build(params[:work])
    if @work.save
      redirect_to root_path
    else
      render 'work/new'
    end
  end

  def show
  end

  def destroy
  end

end
