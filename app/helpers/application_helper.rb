module ApplicationHelper
  def flash_class(level)
    case level
      when "notice"then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-error"
      when "alert" then "alert alert-error"
    end
  end

  def fix_url(url)
    url.starts_with?("http://") ? url: "http://#{url}"
  end

  def display_datetime(date_time)
    date_time.strftime("%I:%M on %B %d, %Y")
  end

  

end
