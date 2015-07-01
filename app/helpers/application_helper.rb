module ApplicationHelper

	def event_time_format(time)
      now = Time.now
      if now - time > 7.days
        l(time, :format => :short)
      else
        distance_of_time_in_words(time, now) + ' ago'
      end
  end

end
