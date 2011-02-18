class LaborsController < MemberController
  before_filter :set_index_values, :only => :index

  def create
    if set_labor_values
      only_one_labor_active(@labor)
      flash[:notice] = ('Actividad creada correctamente')
      redirect_to(labors_path)
    else
      set_index_values
      render :action => :index
    end
  end

  def destroy
    if @labor.destroy
      notice_stickie('Actividad borrada correctamente')
    end
    redirect_to(labors_path)
  end

  def finish
    toggle_story
    if @labor.save
      update_pivotal('finished') if @use_pt
      notice_stickie('Actividad actualizada')
    end
    redirect_to labors_path
  end

  def index
    if @labor.start_at.present?
      notice_stickie('No se puede modificar una actividad que está en marcha. <br />Detén primero la actividad y luego podrás
 modificarla.')
      @labor = Labor.new
    end
  end

  def month
    #@start_at = Date.today.beginning_of_month
    #@end_at   = Date.today.end_of_month
  end

  def show_stories
    @stories = @project.stories.all(:state => "unstarted")
    render :layout => false
  end

  def toggle_end
    toggle_story
    if @labor.save
      only_one_labor_active(@labor)
      notice_stickie('Actividad actualizada')
    end
    redirect_to labors_path
  end

  def update
    @labor.attributes   = params[:labor]
    @labor.job          = find_a_job(params[:job].to_s)
    @labor.set_time_value(params[:time])
    if @labor.save
      notice_stickie('Actividad actualizada correctamente')
    end

    redirect_to labors_path
  end

  def week
    find_week_hours
  end

  protected

  def find_a_job(job_name)
    current_user.company.jobs.find_or_create_by_title(job_name)
  end

  def find_labor
    @labor = current_user.labors.find(params[:id])
  end

  def find_story(sid)
    @story = @project.stories.find(sid)
  end

  def find_week_hours
    d         = params[:date] || Date.today
    @start_at = Date.commercial(d.cwyear, d.cweek, 1)
    @end_at   = Date.commercial(d.cwyear, d.cweek, 6)
    @week     = Hash.new
    i = 0
    (@start_at..@end_at).each do |date|
      @week[i] = [date, current_user.labors.sum_hours(date)]
      i += 1
    end
  end

  def only_one_labor_active(labor)
    if labor.start_at.present?
      current_user.labors.find(:all, :conditions => ["(start_at is not null and id<>?)", labor.id]).each do |labor|
        labor.end_at = Time.now
        labor.update_time
      end
    end
  end

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

  def set_labor_values
    @labor = current_user.labors.new(params[:labor])
    find_story(params[:sid].to_i) if (params[:sid] and (params[:sid].to_i > 0) and @use_pt)

    if @use_pt and @story
      @labor.content       = @story.name
      @labor.job           = find_a_job(@project.name.to_s)
      @labor.sid           = @story.id
    else
      @labor.job           = find_a_job(params[:job].to_s)
    end

    if params[:time]
      @labor.set_time_value(params[:time])
    else
      @labor.start_at        = Time.now
    end

    if @labor.save
      @labor.update_attribute(:created_at, set_date)
      if @use_pt and @story
        @story.current_state = 'started'
        @story.update
      end

      return true
    else
      return false
    end
  end
end
