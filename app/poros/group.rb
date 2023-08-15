  class Group
  attr_reader :id,
              :host_id,
              :host_name,
              :name,
              :friends,
              :events

  def initialize(info)
    @id = info[:id]
    @host_id = info[:attributes][:group_host_id]
    @host_name = info[:attributes][:group_host_name]
    @name = info[:attributes][:group_name]
    @friends = add_friends(info[:attributes][:group_friends]) 
    @events = add_events(info[:attributes][:group_events])
  end

  def add_friends(info)
    if info
      info.map { |friend| FriendListFriend.new(friend) }
    end
  end

  def add_events(info)
    if info
      info.map { |event| EventListEvent.new(event) }
    end
  end
end