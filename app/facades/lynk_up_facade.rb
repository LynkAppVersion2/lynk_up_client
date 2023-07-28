class LynkUpFacade
  def initialize
    @service = LynkUpService.new
  end

  def find_user(id)
    json = @service.get_user(id)
    User.new(json[:data])
  end

  def find_group(id)
    json = @service.get_group(id)
    Group.new(json[:data])
  end

  def find_friend_for_user(user_id, friend_id)
    json = @service.get_friend_for_user(user_id, friend_id)
    Friend.new(json[:data])
  end

  def find_event(id)
    json = @service.get_event(id)
    Event.new(json[:data])
  end
end