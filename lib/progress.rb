class Progress
  def self.call(started_at, hours)
    done_hours = (((Time.now - started_at)/1.day).to_i)*8
    if Time.now.day == started_at.day
      done_hours += calculate_current_day(started_at)
    else
      done_hours += calculate_two_days(started_at)
    end
    done_progress = (done_hours * 100 / hours).round
    done_progress > 100 ? 100 : done_progress
  end

  def self.calculate_current_day(started_at)
    if started_at.hour < 9
      start_time = 9
    elsif started_at.hour > 17
      start_time = 17
    else
      start_time = started_at.hour
    end
    if Time.now.hour < 9
      end_time = 9
    elsif Time.now.hour > 17
      end_time = 17
    else
      end_time = Time.now.hour
    end
    end_time - start_time
  end

  def self.calculate_two_days(started_at)
    done_hours = 0
    if started_at.hour < 17 && started_at.hour > 9
      done_hours += 17 - started_at.hour
    end
    if Time.now.hour < 17 && Time.now.hour > 9
      done_hours += Time.now.hour - 9
    end
    done_hours
  end

end
