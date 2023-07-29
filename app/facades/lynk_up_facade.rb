class LynkUpFacade
  def initialize
    @service = LynkUpService.new
  end

  def find_user(id)
    json = @service.get_user(id)
    User.new(json[:data])
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

# change nil values to empty array in poros