class EventList
  attr_reader :id,
              :group,
              :group_name,
              :title,
              :date,
              :time

  def initialize(info)
    @id = info[:id]
    @group = info[:group]
    @group_name = info[:group_name]
    @title = info[:title]
    @date = info[:date]
    @time = info[:time]
  end
end