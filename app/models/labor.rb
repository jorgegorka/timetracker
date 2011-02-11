class Labor < ActiveRecord::Base

  belongs_to :user
  belongs_to :job

  validates_presence_of :user_id, :job_id

  named_scope :actives, :conditions => "start_at is not null", :order => "labors.created_at desc"

  before_save :update_time

  def self.sum_hours(date)
    tot_hours = tot_frac = sum_hours = frac = 0
    where(["created_at between ? and ?", date.beginning_of_day.utc, date.end_of_day.utc]).order("labors.created_at desc").each do |labor|
      if labor.start_at.present?
        sum_hours, frac = labor.calculate_difference
        frac            = Labor.decimal_to_time(frac)
      end
      sum_hours = sum_hours.to_i + labor.hours
      frac      = frac.to_i + labor.minutes
    end
    tot_hours = sum_hours.to_i
    tot_frac  = frac.to_i

    sum_hours, frac = tot_frac.divmod(60)
    tot_hours      += sum_hours.to_i
    minutes         = frac.to_i
    return "#{tot_hours}:#{minutes}"
  end

  def self.today_activity(date)
    where(["created_at between ? and ?", date.beginning_of_day.utc, date.end_of_day.utc]).order("labors.created_at desc")
  end

  def calculate_difference
    #devuelve los minutos en base 100  1 hora = 100 minutos
    difference  = Time.now - start_at
    hours_total =  difference / (60 * 60)
    return ("%2.2f" % hours_total).split('.')
  end

  def has_story?
    sid.to_i > 0
  end

  def saved_hours
    "#{hours}:#{minutes}"
  end

  def set_time_value(time)
    aux_hours, aux_minutes = time.split(":")
    self.hours             = aux_hours.to_i
    self.minutes           = aux_minutes.to_i if (aux_minutes.to_i < 60)
  end
  
  def update_time
    if end_at.present?
      tot_hours, frac      = calculate_difference
      frac                 = Labor.decimal_to_time(frac)
      sum_hours, sum_frac  = frac.to_i.divmod(100)
      tot_hours            = tot_hours.to_i + sum_hours.to_i
      tot_minutes          = sum_frac.to_i
      self.hours          += tot_hours.to_i
      tot_frac             = sum_frac.to_i + self.minutes
      sum_hours, frac      = tot_frac.divmod(60)
      self.hours          += sum_hours.to_i
      self.minutes         = frac.to_i
      self.start_at        = nil
      self.end_at          = nil
      save
    end
  end

  protected

  def self.decimal_to_time(decimal)
    #convertimos el tiempo en base 100 a base 60 con una sencilla regla de tres
    ((60 * decimal.to_i) / 100).round
  end
end
