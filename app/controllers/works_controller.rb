class WorksController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
   @work = Work.new
   @work.user_id = current_user.id
  end

  def create
   @work = current_user.works.build(params[:work])
   @attainments_worked = @work.attainment_ids
   update_attainment_work unless @attainments_worked.nil?
    if @work.save
      redirect_to attainments_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private 

  def update_attainment_work
    @attainments_worked.each do |attainment_id|
       contribution = current_user.attainments.find_by_id(attainment_id)
       if contribution && @work.progress_metric_id == contribution.progress_metric_id
        if contribution.current.nil?
	         new_work = @work.effort
        else
           new_work = contribution.current + @work.effort
        end
          contribution.update_attribute(:current,new_work)
       end
    end
  end

end
