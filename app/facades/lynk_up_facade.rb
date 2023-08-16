class LynkUpFacade
  def initialize
    @service = LynkUpService.new
  end

  def find_user(id)
    json = @service.get_user(id)
    user = User.new(json[:data])
  end

  def datetime_parser(event)
    date_split = event.date.split("-")
    time_split = event.time.split(":")
    DateTime.new(date_split[0].to_i, date_split[1].to_i, date_split[2].to_i, time_split[0].to_i, time_split[1].to_i, time_split[2].to_i)
  end
  
  def sort_events(events)
    sorted_events = events.sort_by do |event|
      datetime_parser(event)
    end
  
    sorted_events
  end

  def combine_events(my_events, invited_to_events)
    all_events = []
    all_events << my_events
    all_events << invited_to_events

    sort_events(all_events.flatten)
  end

  
  def upcoming_events(events)
    events.select do |event|
      event if DateTime.now <= datetime_parser(event)
    end
  end

  def past_events(events)
    events.select do |event|
      event if DateTime.now > datetime_parser(event)
    end.reverse
  end

  def find_all_users
    json = @service.get_all_users
    json[:data].map do |data|
      User.new(data)
    end
  end

  def change_user_info(id, params)
    json = @service.update_user(id, params)
    User.new(json)
  end

  def find_group(id)
    json = @service.get_group(id)
    Group.new(json[:data])
  end

  def find_all_groups
    json = @service.get_all_groups
    json[:data].map do |data|
      Group.new(data)
    end
  end

  # def change_group_info(id, params)
  #   json = @service.update_group(id, params)
  #   Group.new(json)
  # end

  def find_all_user_friends(id)
    json = @service.get_friends_for_user(id)
    json[:data][:friends].map do |data|
      FriendListFriend.new(data)
    end
  end

  def find_friend_for_user(user_id, friend_id)
    json = @service.get_friend_for_user(user_id, friend_id)
    Friend.new(json[:data])
  end

  def find_event(id)
    json = @service.get_event(id)
    Event.new(json[:data])
  end

  def find_all_events
    json = @service.get_all_events
    json[:data].map do |data|
      Event.new(data)
    end
  end

  def change_event_info(id, params)
    json = @service.update_event(id, params)
    Event.new(json)
  end
end