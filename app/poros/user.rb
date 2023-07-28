class User
  attr_reader :id,
              :user_name,
              :phone_number,
              :full_name,
              :my_events,
              :invited_to_events,
              :my_groups,
              :included_in_groups

  def initialize(info)
    @id = info[:id]
    @user_name = info[:attributes][:user_name]
    @phone_number = info[:attributes][:phone_number]
    @full_name = info[:attributes][:full_name]
    @my_events = add_my_events(info[:attributes][:my_events])
    @invited_to_events = add_invited_to_events(info[:attributes][:invited_to_events])
    @my_groups = add_my_groups(info[:attributes][:my_groups])
    @included_in_groups = add_included_in_groups(info[:attributes][:included_in_groups])
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