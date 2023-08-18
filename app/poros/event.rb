class Event
  attr_reader :id,
              :group_id,
              :group_name,
              :title,
              :date_time,
              :formatted_datetime,
              :address,
              :description,
              :invited

  def initialize(info)
    @id = info[:id]
    @group_id = info[:group]
    @group_name = info[:group_name]
    @title = info[:title]
    @date_time = info[:date_time]
    @formatted_datetime = format_datetime(info[:date_time])
    @address = info[:address]
    @description = info[:description]
    @invited = add_invited(info[:invited])
  end

  def add_invited(info)
    if info
      info.map { |friend| FriendListFriend.new(friend) }
    end
  end

  def format_datetime(datetime_stamp)
    input_datetime = DateTime.strptime(datetime_stamp, "%Y-%m-%dT%H:%M:%SZ")
    input_datetime.strftime("%a %B %d, %Y at %I:%M %p")
  end
end