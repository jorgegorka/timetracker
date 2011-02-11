class LaborsController < MemberController
  before_filter :set_index_values, :only => :index

  def create
    if set_labor_values
      only_one_labor_active(@labor)
      notice_stickie('Actividad creada correctamente')
      redirect_to(labors_path)
    else
      set_index_values
      render :action => :index
    end
  end

  def index
    @labor = Labor.new
  end

  protected

  def set_date
    params[:date].present? ? Date.parse(params[:date]) : Time.now
  rescue ArgumentError
    Time.now
  end

  def set_index_values
    find_labor if params[:id]
    @labor     ||= Labor.new
    @date      = set_date
    @recents   = current_user.labors.today_activity(@date)
    @total     = current_user.labors.sum_hours(@date)
  end
end
