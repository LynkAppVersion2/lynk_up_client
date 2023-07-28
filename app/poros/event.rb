class Event
  attr_reader :id,
              :group_id,
              :group_name,
              :title,
              :date,
              :time,
              :address,
              :description,
              :invited

  def initialize(info)
    @id = info[:id]
    @group_id = info[:group]
    @group_name = info[:group_name]
    @title = info[:title]
    @date = info[:date]
    @time = info[:time]
    @address = info[:address]
    @description = info[:description]
    @invited = add_invited(info[:invited])
  end

  def add_invited(info)
    if info
      info.map { |friend| FriendList.new(friend) }
    end
  end
end