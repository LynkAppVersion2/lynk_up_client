class EventListEvent
  attr_reader :id,
              :group,
              :group_name,
              :title,
              :date_time,
              :formatted_datetime

  def initialize(info)
    @id = info[:id]
    @group = info[:group]
    @group_name = info[:group_name]
    @title = info[:title]
    @date_time = info[:date_time]
    @formatted_datetime = format_datetime(info[:date_time])
  end

  def format_datetime(datetime_stamp)
    input_datetime = DateTime.strptime(datetime_stamp, "%Y-%m-%dT%H:%M:%SZ")
    input_datetime.strftime("%a %B %d, %Y at %I:%M %p")
  end
end