class WorksController < ApplicationController
  def index
  end

  def new
   @work = Work.new
   @work.user_id = current_user.id
  end

  def create
   @work = current_user.works.build(params[:work])
   #@attainments_worked = @work.attainment_ids
   #update_attainment_work unless @attainmemts_worked.nil?
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

  private 

  def update_attainment_work
    @attainments_worked.any? do |attainment_id|
       contribution = current_user.attainments.find_by_id(attainment_id)
       if contribution
        new_work = contribution.current + @work.effort
        attainment_worked.update_attribute(:current,new_work)
       end
    end
  end

end
