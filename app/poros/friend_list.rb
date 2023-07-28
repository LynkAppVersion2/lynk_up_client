class FriendList
  attr_reader :id,
              :user_name,
              :phone_number,
              :full_name,
              :my_events,
              :invited_to_events,
              :my_groups,
              :included_in_groups

  def initialize(info)
    @id = info[:user_id]
    @user_name = info[:user_name]
    @phone_number = info[:phone_number]
    @full_name = info[:full_name]
    @my_events = add_my_events(info[:my_events]) 
    @invited_to_events = add_invited_to_events(info[:invited_to_events]) 
    @my_groups = add_my_groups(info[:my_groups]) 
    @included_in_groups = add_included_in_groups(info[:included_in_groups]) 
  end

  def add_my_events(info)
    if info
      info.map { |event| EventList.new(event) }
    end
  end

  def add_invited_to_events(info)
    if info
      info.map { |event| EventList.new(event) }
    end
  end

  def add_my_groups(info)
    if info
      info.map { |group| GroupList.new(group) }
    end
  end

  def add_included_in_groups(info)
    if info
      info.map { |group| GroupList.new(group) }
    end
  end
end